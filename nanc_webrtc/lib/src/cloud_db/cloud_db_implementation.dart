import 'dart:async';

import 'package:nanc_webrtc/src/cloud_db/auth_response_to_user.dart';
import 'package:nanc_webrtc/src/cloud_db/cloud_db_interface.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:nanc_webrtc/src/sea_table/user_dto.dart';
import 'package:supabase/src/supabase_stream_builder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tools/tools.dart';

const String _kInvalidCredentialsErrorMessage = 'Invalid login credentials';
const String _kEmailNotConfirmedErrorMessage = 'Email not confirmed';
const String _invalidRefreshToken = 'Invalid Refresh Token';
const String _kHosts = 'hosts';
const String _kClients = 'clients';
const String _kSessionKey = 'SESSION_KEY';

class CloudDbImplementation implements CloudDb {
  CloudDbImplementation({
    required this.client,
    required this.dbService,
  });

  final SupabaseClient client;
  final DbService dbService;

  StreamSubscription<AuthState>? _authStateSubscription;
  SupabaseQueryBuilder get _hosts => client.from(_kHosts);
  SupabaseQueryBuilder get _clients => client.from(_kClients);

  final Map<String, StreamController<ClientDto>> _clientsUpdates = {};

  @override
  Future<UserDto> authorize({required String email, required String password}) async {
    _authStateSubscription = client.auth.onAuthStateChange.listen(_authHandler);
    try {
      if (await dbService.has(_kSessionKey)) {
        return restoreSession();
      }
    } catch (error) {
      logg(error);
    }

    late final AuthResponse response;

    try {
      response = await _signIn(password: password, email: email);
    } on AuthException catch (exception) {
      if (exception.message == _kInvalidCredentialsErrorMessage || exception.message == _kEmailNotConfirmedErrorMessage) {
        /// ? If the user is not exists - we'll create him
        /// ? If exists, but not confirmed - we'll use signUp method for retrieve him from the DB
        response = await _registerUser(password: password, email: email);
      } else {
        throw Exception(exception.message);
      }
    } catch (error) {
      rethrow;
    }
    await _saveRefreshToken(response);
    return response.toUser();
  }

  @override
  Future<UserDto> restoreSession() async {
    final bool sessionExists = await dbService.has(_kSessionKey);
    if (sessionExists) {
      final String? refreshToken = await dbService.get(_kSessionKey);
      try {
        final AuthResponse response = await client.auth.setSession(refreshToken!);
        await _saveRefreshToken(response);
        return response.toUser();
      } on AuthException catch (error) {
        if (error.message == _invalidRefreshToken) {
          await dbService.delete(_kSessionKey);
          rethrow;
        } else {
          rethrow;
        }
      } catch (error) {
        logg(error);
      }
    }
    throw Exception('Session not found');
  }

  void _authHandler(AuthState authState) {
    logg('Auth state: $authState');
  }

  @override
  Future<UserDto> signIn({required String password, required String email}) async {
    final AuthResponse result = await _signIn(password: password, email: email);
    final User? user = result.user;
    if (user == null) {
      throw Exception('User not found');
    }
    return UserDto(
      id: user.id,
      email: user.email!,
      confirmed: user.emailConfirmedAt != null,
    );
  }

  Future<AuthResponse> _signIn({required String password, required String email}) async => client.auth.signInWithPassword(password: password, email: email);

  Future<AuthResponse> _registerUser({required String password, required String email}) async {
    try {
      final AuthResponse response = await client.auth.signUp(password: password, email: email);

      if (response.user == null) {
        throw Exception('There are a problem with user auth');
      }

      if (response.user!.email == null) {
        throw Exception('User have no specified email');
      }
      return response;
    } catch (error) {
      // Handle error
      logg(1);
      rethrow;
    }
  }

  @override
  Future<void> deleteClient(int clientId) async => await _clients.delete().eq('id', clientId);

  @override
  Future<void> deleteHost(String roomId) async {
    await _clients.delete().eq('room_id', roomId);
    await _hosts.delete().eq('room_id', roomId);
  }

  @override
  Future<ClientDto?> getClient(int clientId) async {
    final Json? rawClient = await _clients.select<Json?>().eq('id', clientId).single();
    if (rawClient == null) {
      return null;
    }
    return ClientDto.fromJson(rawClient);
  }

  @override
  Future<ClientDto> awaitConnectedClient(String roomId) async {
    final Completer<ClientDto> clientsCompleter = Completer();
    void handler(SupabaseStreamEvent event) {
      for (final Json json in event) {
        final ClientDto client = ClientDto.fromJson(json);
        if (client.roomId == roomId && client.isConnected) {
          clientsCompleter.complete(client);
        }
      }
    }

    final StreamSubscription<SupabaseStreamEvent> subscription = _clients.stream(primaryKey: ['id']).eq('room_id', roomId).listen(handler);
    final ClientDto connectedClient = await clientsCompleter.future;
    await subscription.cancel();
    return connectedClient;
  }

  @override
  Future<List<ClientDto>> getClients(String roomId) async {
    final List<Json> rawClients = await _clients.select<List<Json>>().eq('room_id', roomId);
    return rawClients.map(ClientDto.fromJson).toList();
  }

  @override
  Future<HostDto?> getHost(String roomId) async {
    final Json? rawHost = await _hosts.select<Json?>().eq('room_id', roomId).single();
    if (rawHost == null) {
      return null;
    }
    return HostDto.fromJson(rawHost);
  }

  @override
  Future<ClientDto> saveClient(ClientDto client) async {
    await _clearOldData();
    await _clients.upsert(_enrich(client.toJson()));
    final Json rawClient = await _clients.select<Json>().eq('room_id', client.roomId).single();
    return ClientDto.fromJson(rawClient);
  }

  @override
  Future<HostDto> saveHost(HostDto host) async {
    await _clearOldData();
    await _hosts.upsert(_enrich(host.toJson()));
    final HostDto? savedHost = await getHost(host.roomId);
    return savedHost!;
  }

  Future<void> _clearOldData() async {
    await _hosts.delete().lte('created_at', DateTime.now().subtract(const Duration(hours: 24)));
    await _clients.delete().lte('created_at', DateTime.now().subtract(const Duration(hours: 24)));
  }

  @override
  Future<void> dispose() async {
    await _authStateSubscription?.cancel();
    await client.removeAllChannels();
  }

  Json _enrich(Json value) {
    value['user_id'] = client.auth.currentSession?.user.id;
    return value;
  }

  Future<void> _saveRefreshToken(AuthResponse response) async => dbService.save(key: _kSessionKey, value: response.session?.refreshToken);
}
