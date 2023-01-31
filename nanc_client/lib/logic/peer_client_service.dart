import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';

class PeerClientService {
  PeerClientService({
    required PeerServiceFactory peerServiceFactory,
  }) : _peerServiceFactory = peerServiceFactory;

  final PeerServiceFactory _peerServiceFactory;
  PeerService? _peerService;

  PeerService get peerService => _peerService!;

  Future<PeerService> connectToBackend({
    required String backendPeerId,
    required SerializedMessageHandler messageHandler,
    required VoidCallback onClose,
  }) async {
    if (_peerService != null) {
      return peerService;
    }
    _peerService = _peerServiceFactory.createPeerService(messageHandler: messageHandler, onClose: onClose);
    await peerService.peerId;
    await peerService.connect(backendPeerId);
    return peerService;
  }

  Future<void> disconnect() async {
    await _peerService?.dispose();
    _peerService = null;
    Analytics.sendEvent('CONNECTION_WITH_BACKEND_DISCONNECTED');
  }
}
