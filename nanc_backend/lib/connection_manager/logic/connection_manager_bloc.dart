import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_backend/connection_manager/logic/connection_manager_state.dart';
import 'package:nanc_backend/connection_manager/logic/model/client.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

class ConnectionManagerBloc extends Cubit<ConnectionManagerState> {
  ConnectionManagerBloc({
    required this.peerServiceFactory,
  }) : super(ConnectionManagerState.empty());

  final PeerServiceFactory peerServiceFactory;

  final Map<String, PeerService> _services = {};
  PeerService? _service;

  Future<void> createConnection() async {
    if (state.isNotEmptyId) {
      // Show message about already loading connection
      return;
    }
    emit(state.copyWith(isLoading: true));
    _service = peerServiceFactory.createPeerService(messageHandler: _clientMessageHandler, onClose: () => _onClose('TODO'));
    final String myPeerId = await _service!.peerId;
    final String encryptedPeerId = await encrypt(myPeerId);
    emit(state.copyWith(
      freshRoomId: encryptedPeerId,
      isLoading: false,
    ));
    unawaited(_awaitConnectedClient(myPeerId));
  }

  void _clientMessageHandler(dynamic serializedMessage) {
    logg('Got a message from the client "$serializedMessage"');
  }

  Future<void> _onClose(String backendPeerId) async {
    logg('Closing connection "$backendPeerId"');
    await _disposeHandler(backendPeerId);
  }

  Future<void> sendPageDataToTheClients({required Model model, required Json page}) async {
    final Map<String, dynamic> message = <String, dynamic>{
      'messageType': kUpdatePage,
      'oneWay': true,
      'value': {
        kModelId: model.id,
        kPageData: page,
      },
    };
    final String serializedMessage = jsonEncode(message);

    for (final PeerService service in _services.values) {
      await service.sendMessage(serializedMessage);
    }
  }

  Future<void> _awaitConnectedClient(String backendPeerId) async {
    final Completer<void> connectionCompleter = Completer();
    final StreamSubscription<ConnectionStatus> subscription = _service!.statusStream.listen((ConnectionStatus status) {
      logg('GOT "$status" STATUS ON THE BACKEND SIDE');
      if (status == ConnectionStatus.closed) {
        //
      } else if (status == ConnectionStatus.connection) {
        //
      } else if (status == ConnectionStatus.connected) {
        connectionCompleter.complete();
        final List<Client> oldClients = List.of(state.clients);
        oldClients.add(
          Client(
            roomId: state.freshRoomId,
            status: ClientStatus.connected,
            serviceId: backendPeerId,
          ),
        );
        emit(state.copyWith(
          freshRoomId: '',
          clients: oldClients,
        ));
        _services[backendPeerId] = _service!;
        _service = null;
      }
    });
    logg.wrap('CLIENT CONNECTING');
    await connectionCompleter.future;
    logg.wrap('CLIENT CONNECTED');
    await subscription.cancel();
  }

  Future<void> _disposeHandler(String serviceId) async {
    _services.remove(serviceId);
    final List<Client> clientsWithOffline = [];
    for (final Client client in state.clients) {
      if (client.serviceId == serviceId) {
        clientsWithOffline.add(client.copyWith(status: ClientStatus.disconnected));
      } else {
        clientsWithOffline.add(client);
      }
    }
    emit(state.copyWith(
      clients: clientsWithOffline,
    ));
    await wait(duration: const Duration(seconds: 1));
    final List<Client> onlineClients = clientsWithOffline.where((Client client) => client.serviceId != serviceId).toList();
    emit(state.copyWith(
      clients: onlineClients,
    ));
  }
}
