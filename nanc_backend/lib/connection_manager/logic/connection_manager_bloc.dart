import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_backend/connection_manager/logic/connection_manager_state.dart';
import 'package:nanc_backend/connection_manager/logic/model/client.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

class ConnectionManagerBloc extends Cubit<ConnectionManagerState> {
  ConnectionManagerBloc({
    required this.webRTCServiceFactory,
    required this.webRTCServiceDisposeStream,
  }) : super(ConnectionManagerState.empty()) {
    _initDisposeHandler();
  }

  final WebRTCServiceFactory webRTCServiceFactory;
  final Stream<String> webRTCServiceDisposeStream;

  final Map<String, WebRTCService> _services = {};
  Timer? _awaitingTimer;
  WebRTCService? _service;
  StreamSubscription<String>? _disposeStreamSubscription;

  Future<void> createConnection() async {
    if (state.isNotEmptyId) {
      // Show message about already loading connection
      return;
    }
    emit(state.copyWith(isLoading: true));
    _service = webRTCServiceFactory.create();
    await _service!.init();
    final String roomId = await _service!.createOffer();
    emit(state.copyWith(
      freshRoomId: roomId,
      isLoading: false,
    ));
    unawaited(_awaitConnectedClient());
  }

  Future<void> sendPageDataToTheClients({required Model model, required Json page}) async {
    for (final WebRTCService service in _services.values) {
      await service.sendMessage(
        messageType: kUpdatePage,
        oneWay: true,
        value: {
          kModelId: model.id,
          kPageData: page,
        },
      );
    }
  }

  Future<void> _awaitConnectedClient() async {
    await _service!.haveConnectedClient();
    _awaitingTimer?.cancel();
    _awaitingTimer = null;
    await _service!.addCandidates(state.freshRoomId);
    final List<Client> oldClients = List.of(state.clients);
    oldClients.add(
      Client(
        roomId: state.freshRoomId,
        status: ClientStatus.connected,
        serviceId: _service!.id,
      ),
    );
    emit(state.copyWith(
      freshRoomId: '',
      clients: oldClients,
    ));
    _services[_service!.id] = _service!;
    _service = null;
  }

  void _initDisposeHandler() => _disposeStreamSubscription = webRTCServiceDisposeStream.listen(_disposeHandler);

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
    await wait(const Duration(seconds: 1));
    final List<Client> onlineClients = clientsWithOffline.where((Client client) => client.serviceId != serviceId).toList();
    emit(state.copyWith(
      clients: onlineClients,
    ));
  }
}
