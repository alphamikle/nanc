import 'package:nanc_webrtc/src/cloud_db/cloud_db_implementation.dart';
import 'package:nanc_webrtc/src/sea_table/api_config.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:nanc_webrtc/src/sea_table/user_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tools/tools.dart';

abstract class CloudDb {
  Future<UserDto> authorize({required String email, required String password});

  Future<UserDto> signIn({required String email, required String password});

  Future<UserDto> restoreSession();

  Future<HostDto?> getHost(String roomId);

  Future<List<ClientDto>> getClients(String roomId);

  Future<ClientDto> awaitConnectedClient(String roomId);

  Future<ClientDto?> getClient(int clientId);

  Future<HostDto> saveHost(HostDto host);

  Future<ClientDto> saveClient(ClientDto client);

  Future<void> deleteClient(int clientId);

  Future<void> deleteHost(String roomId);

  Future<void> dispose();
}

CloudDb createCloudDb(DbService dbService) {
  return CloudDbImplementation(
    dbService: dbService,
    client: SupabaseClient(kSupaHost, kSupaKey),
  );
}
