import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peerdart/peerdart.dart';

typedef SerializedMessageHandler = void Function(dynamic serializedMessage);

enum Event {
  open('open'),
  data('data'),
  binary('binary'),
  connection('connection'),
  close('close');

  const Event(this.id);
  final String id;
}

enum ConnectionStatus {
  closed,
  connection,
  connected,
}

class PeerService {
  PeerService({
    required SerializedMessageHandler messageHandler,
    required VoidCallback onClose,
  })  : _onClose = onClose,
        _messageHandler = messageHandler {
    unawaited(_prepare());
  }

  final SerializedMessageHandler _messageHandler;
  final VoidCallback _onClose;
  final Completer<String> _myPeerIdCompleter = Completer();
  Future<String> get peerId => _myPeerIdCompleter.future;

  final Peer _peer = Peer(
    options: PeerOptions(debug: LogLevel.All),
  );
  late DataConnection _dataConnection;
  final StreamController<ConnectionStatus> _statusStreamController = StreamController.broadcast();
  Stream<ConnectionStatus> get statusStream => _statusStreamController.stream;

  Future<void> connect(String peerId) async {
    _statusStreamController.add(ConnectionStatus.connection);
    _dataConnection = _peer.connect(peerId);

    _dataConnection.on<void>(Event.open.id).listen((_) {
      _statusStreamController.add(ConnectionStatus.connected);
    });

    _dataConnection.on<void>(Event.close.id).listen((_) {
      _statusStreamController.add(ConnectionStatus.closed);
      _onClose();
    });

    _dataConnection.on<dynamic>(Event.data.id).listen(_messageHandler);
  }

  Future<void> sendMessage(String serializedData) async => _dataConnection.send(serializedData);

  Future<void> dispose() async {
    _peer.dispose();
    _statusStreamController.add(ConnectionStatus.closed);
    await _statusStreamController.close();
  }

  Future<void> _prepare() async {
    _peer.on<void>(Event.open.id).listen((_) {
      _myPeerIdCompleter.complete(_peer.id);
    });

    _peer.on<DataConnection>(Event.connection.id).listen((DataConnection dataConnection) {
      _statusStreamController.add(ConnectionStatus.connected);
      _dataConnection = dataConnection;

      _dataConnection.on<String>(Event.data.id).listen(_messageHandler);

      _dataConnection.on<void>(Event.close.id).listen((_) {
        _statusStreamController.add(ConnectionStatus.closed);
        _onClose();
      });
    });
  }
}

class PeerServiceFactory {
  factory PeerServiceFactory() => _instance ??= PeerServiceFactory._();
  PeerServiceFactory._();

  static PeerServiceFactory? _instance;

  PeerService createPeerService({
    required SerializedMessageHandler messageHandler,
    required VoidCallback onClose,
  }) {
    return PeerService(
      messageHandler: messageHandler,
      onClose: onClose,
    );
  }
}
