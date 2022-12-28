import 'dart:async';

import 'package:nanc_webrtc/nanc_webrtc.dart';

class WebRTCClientService {
  WebRTCClientService({
    required this.webRTCServiceFactory,
  });

  final WebRTCServiceFactory webRTCServiceFactory;
  WebRTCService? _connectionService;
  int _candidatesCounter = 0;

  WebRTCService get connectionService => _connectionService!;

  Future<void> connectToBackend(String connectionId) async {
    if (_connectionService != null) {
      return;
    }
    final WebRTCService rtcService = webRTCServiceFactory.create();
    _connectionService = rtcService;
    await rtcService.init();

    await rtcService.saveRemoteDescription(connectionId);
    await rtcService.createAnswer(connectionId);
    await rtcService.addCandidates(connectionId);
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      rtcService.addCandidates(connectionId);
      _candidatesCounter++;
      if (_candidatesCounter > 10) {
        timer.cancel();
      }
    });
  }

  Future<void> disconnect() async {
    if (_connectionService == null) {
      return;
    }
    await _connectionService!.dispose();
    _connectionService = null;
  }
}
