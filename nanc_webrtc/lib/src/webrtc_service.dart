import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:nanc_webrtc/src/constants/webrtc_constants.dart';
import 'package:nanc_webrtc/src/sea_table/dto/client_dto.dart';
import 'package:nanc_webrtc/src/sea_table/dto/host_dto.dart';
import 'package:tools/tools.dart';

final log = logg.raw('WEB RTC');

typedef MessageHandler = FutureOr<Message?> Function(Message message);

class WebRTCService {
  WebRTCService._({
    required this.id,
    required this.cloudDb,
    required this.onDispose,
  });

  final String id;
  final CloudDb cloudDb;
  final ValueChanged<String> onDispose;
  RTCPeerConnection? _peer;
  RTCDataChannel? _dataChannel;
  bool _isBackend = false;
  bool get _isClient => _isBackend == false;

  HostDto? _host;
  ClientDto? _client;
  Timer? _candidatesTimer;

  bool get isInitialized => _host != null || _client != null;

  RTCPeerConnection get peer => _peer!;

  String get roomId => (_host?.roomId ?? _client?.roomId)!;

  final Map<String, Completer<Message>> _eventsCompleters = {};
  final Set<Json> _localCandidates = {};
  final Set<Json> _remoteCandidates = {};
  final Map<String, MessageHandler> _handlers = {};

  List<Json> get iceCandidatesJson => _localCandidates.toList();

  Future<void> init() async {
    log('INIT');
    if (_peer != null) {
      return;
    }
    await _createConnection();
    _initListeners();
  }

  Future<Message?> sendMessage({
    required String messageType,
    String? messageId,
    Object? value,
    Duration timeout = const Duration(seconds: 10),
    bool oneWay = false,
  }) async {
    final Completer<Message> responseCompleter = Completer();
    final String effectiveMessageId = messageId ?? generateEventHash();
    final String communicationId = _createCommunicationId(messageType: messageType, messageId: effectiveMessageId);
    _eventsCompleters[communicationId] = responseCompleter;
    log('SENT MESSAGE ($communicationId)');
    await _dataChannel?.send(
      RTCDataChannelMessage(
        jsonEncode(
          Message(
            messageId: effectiveMessageId,
            messageType: messageType,
            payload: value,
          ).toJson(),
        ),
      ),
    );
    if (oneWay) {
      return null;
    }
    _startGCForResponses(communicationId: communicationId, duration: timeout);
    final Message result = await responseCompleter.future;
    if (result.isError) {
      if (result.hasPayload) {
        throw Exception(result.payload!);
      } else {
        throw Exception('Error on messaging. Message type was "$messageType"');
      }
    }
    return result;
  }

  void registerMessageHandler({required String messageType, required MessageHandler handler}) => _handlers[messageType] = handler;

  void removeMessageHandler(String messageType) => _handlers.remove(messageType);

  Future<String> createOffer() async {
    if (_host != null) {
      return roomId;
    }
    log('CREATE OFFER');
    _dataChannel = await peer.createDataChannel('transport', RTCDataChannelInit()..id = 1);
    _dataChannel!.onMessage = _onMessage;
    final RTCSessionDescription offer = await peer.createOffer();
    _isBackend = true;
    await peer.setLocalDescription(offer);
    _host = await cloudDb.saveHost(
      HostDto(
        id: -1,
        roomId: Ulid().toCanonical(),
        offer: castToJson(offer.toMap()),
        candidates: iceCandidatesJson,
        hasConnectedClients: false,
        createdAt: DateTime.now(),
      ),
    );
    _onIceCandidate();
    return encrypt(_host!.roomId);
  }

  Future<void> createAnswer(String roomId) async {
    log('CREATE ANSWER');
    _initDataChannelListener();
    final RTCSessionDescription answer = await peer.createAnswer();
    await peer.setLocalDescription(answer);
    _host = await cloudDb.getHost(roomId);
    _client = await cloudDb.saveClient(
      ClientDto(
        id: -1,
        roomId: roomId,
        candidates: iceCandidatesJson,
        answer: castToJson(answer.toMap()),
        isConnected: false,
        createdAt: DateTime.now(),
      ),
    );
    _onIceCandidate();
  }

  Future<void> saveRemoteDescription(String roomId) async {
    if (_isBackend) {
      log('SAVE REMOTE DESCRIPTION (BACKEND)');
      await _saveRemoteDescriptionForHost(roomId);
    } else {
      log('SAVE REMOTE DESCRIPTION (CLIENT)');
      await _saveRemoteDescriptionForClient(roomId);
    }
  }

  Future<void> addCandidates(String connectionId) async {
    if (_isBackend) {
      log('ADD CANDIDATES (BACKEND)');
      await _addCandidatesForHost(connectionId);
    } else {
      log('ADD CANDIDATES (CLIENT)');
      await _addCandidatesForClient(connectionId);
    }
  }

  Future<bool> haveConnectedClient() async {
    if (_isBackend == false) {
      return false;
    }
    await cloudDb.awaitConnectedClient(roomId);
    await saveRemoteDescription(roomId);
    log('HAVE CLIENTS FOR CONNECTION $roomId');
    return true;
  }

  Future<void> dispose() async {
    log('DISPOSE');
    if (_isClient) {
      await _sendDisposalMessageToBackend();
    } else {
      await _sendDisposalMessageToClient();
    }
    if (_isClient && _client != null) {
      await cloudDb.deleteClient(_client!.id);
    }
    if (_isBackend && _host != null) {
      await cloudDb.deleteHost(roomId);
    }
    await _softDispose();
    onDispose(id);
  }

  Future<void> _softDispose() async {
    await _dataChannel?.close();
    await _peer?.close();
    _candidatesTimer?.cancel();
    _peer = null;
    _dataChannel = null;
    _candidatesTimer = null;
    _isBackend = false;
    _host = null;
    _client = null;
    _localCandidates.clear();
    _remoteCandidates.clear();
  }

  /// ? This method will be called, when we want to dispose a client
  Future<void> _sendDisposalMessageToBackend() async => sendMessage(messageType: kDisposeClientMessage);

  /// ? This method will be called, when we want to dispose a backend and all its clients
  Future<void> _sendDisposalMessageToClient() async => sendMessage(messageType: kDisposeHostMessage);

  Future<void> _addCandidatesForHost(String roomId) async {
    final List<ClientDto> clients = await cloudDb.getClients(roomId);
    bool haveActiveClient = false;
    for (final ClientDto client in clients) {
      for (final Json candidate in client.candidates) {
        if (_remoteCandidates.contains(candidate)) {
          continue;
        }
        _remoteCandidates.add(candidate);
        await peer.addCandidate(RTCIceCandidate(
          candidate['candidate'] as String?,
          candidate['sdpMid'] as String?,
          candidate['sdpMlineIndex'] as int?,
        ));
        haveActiveClient = true;
      }
    }
    _host = await cloudDb.saveHost(_host!.copyWith(
      hasConnectedClients: haveActiveClient,
      createdAt: DateTime.now(),
    ));
  }

  Future<void> _addCandidatesForClient(String roomId) async {
    if (_peer == null) {
      return;
    }
    final HostDto? host = await cloudDb.getHost(roomId);
    if (host == null) {
      throw Exception('Not found a host for the roomId($roomId)');
    }
    _host = host;
    for (final Json candidate in host.candidates) {
      if (_remoteCandidates.contains(candidate)) {
        continue;
      }
      _remoteCandidates.add(candidate);
      await peer.addCandidate(RTCIceCandidate(
        candidate['candidate'] as String?,
        candidate['sdpMid'] as String?,
        candidate['sdpMlineIndex'] as int?,
      ));
    }
    _client = await cloudDb.saveClient(_client!.copyWith(
      isConnected: true,
      createdAt: DateTime.now(),
    ));
  }

  Future<void> _saveRemoteDescriptionForHost(String roomId) async {
    final List<ClientDto> clients = await cloudDb.getClients(roomId);
    clients.sort((ClientDto first, ClientDto second) => first.createdAt.compareTo(second.createdAt));

    /// ? Check - if it possible ho have several active clients
    for (final ClientDto client in clients) {
      final Json answer = client.answer;
      final RTCSessionDescription session = RTCSessionDescription(answer['sdp'] as String?, 'answer');
      await peer.setRemoteDescription(session);
    }
  }

  Future<void> _saveRemoteDescriptionForClient(String roomId) async {
    _host = await cloudDb.getHost(roomId);
    if (_host == null) {
      throw Exception('Not found a host for the roomId($roomId)');
    }
    final Json offer = _host!.offer;
    final RTCSessionDescription session = RTCSessionDescription(offer['sdp'] as String?, 'offer');
    await peer.setRemoteDescription(session);
  }

  void _onIceCandidate([RTCIceCandidate? candidate]) {
    _candidatesTimer?.cancel();
    if (candidate != null && candidate.candidate != null) {
      _localCandidates.add(candidate.toMap() as Json);
      log('ON ICE CANDIDATE [$_isBackend]: "${candidate.candidate}"');
    }
    _candidatesTimer = Timer(const Duration(milliseconds: 500), () async {
      if (isInitialized == false) {
        return;
      }
      if (_isBackend) {
        _host = await cloudDb.saveHost(_host!.copyWith(
          candidates: iceCandidatesJson,
          createdAt: DateTime.now(),
        ));
      } else {
        if (_client == null) {
          return;
        }
        _client = await cloudDb.saveClient(_client!.copyWith(
          candidates: iceCandidatesJson,
          createdAt: DateTime.now(),
        ));
      }
    });
  }

  Future<void> _createConnection() async {
    _peer = await createPeerConnection(
      <String, dynamic>{
        'iceServers': [
          {
            'url': 'stun:stun.l.google.com:19302',
          },
        ]
      },
    );
  }

  void _onDataChannel(RTCDataChannel channel) {
    log('ON DATA CHANNEL [$_isBackend]: "${channel.label}" | "${channel.id}"');
    _dataChannel = channel;
    channel.onMessage = _onMessage;
    channel.onDataChannelState = _onDataChannelState;
  }

  Future<void> _disposeClientHandler(Message message) async {
    log('DISPOSE CLIENT');
    await _sendResponse(message);
    await wait(duration: const Duration(seconds: 1));
    await _softDispose();
  }

  Future<void> _disposeHostHandler(Message message) async {
    log('DISPOSE HOST');
    await _sendResponse(message);
    await wait(duration: const Duration(seconds: 1));
    await _softDispose();
  }

  Future<void> _sendResponse(Message message) async {
    await _dataChannel?.send(RTCDataChannelMessage(jsonEncode(message.response.toJson())));
  }

  void _responseHandler(Message message) {
    final String communicationId = _createCommunicationId(messageType: message.messageType, messageId: message.messageId);
    final Completer<Message>? completer = _eventsCompleters[communicationId];
    _eventsCompleters.remove(communicationId);
    if (completer == null) {
      log('Completer not found for the message (${message.messageType}). Maybe there is too small timeout?');
    } else {
      completer.complete(message);
    }
  }

  Future<void> _onMessage(RTCDataChannelMessage message) async {
    final Message incomeMessage = Message.fromJson(jsonDecode(message.text));
    if (incomeMessage.isResponse) {
      _responseHandler(incomeMessage);
      return;
    }

    /// ? This message can be sent from the client to the host
    if (incomeMessage.messageType == kDisposeClientMessage) {
      await _disposeClientHandler(incomeMessage);
      return;
    }

    /// ? And this vice versa
    if (incomeMessage.messageType == kDisposeHostMessage) {
      await _disposeHostHandler(incomeMessage);
      return;
    }
    final MessageHandler? handler = _handlers[incomeMessage.messageType];
    Message? outcomeMessage;
    if (handler == null) {
      outcomeMessage = Message(messageType: incomeMessage.messageType, messageId: incomeMessage.messageId, payload: 'Not found handler', isError: true);
      await _sendResponse(outcomeMessage);
    } else {
      try {
        outcomeMessage = await handler(incomeMessage);
        outcomeMessage ??= Message(messageType: incomeMessage.messageType, messageId: incomeMessage.messageId, payload: null);
        await _sendResponse(outcomeMessage);
      } catch (error) {
        outcomeMessage = Message(messageType: incomeMessage.messageType, messageId: incomeMessage.messageId, payload: error.toString(), isError: true);
        await _sendResponse(outcomeMessage);
        rethrow;
      }
    }
    log('ON MESSAGE [$_isBackend]: $incomeMessage');
  }

  void _startGCForResponses({required String communicationId, required Duration duration}) {
    Timer(duration, () {
      if (_eventsCompleters.containsKey(communicationId)) {
        final Completer completer = _eventsCompleters[communicationId]!;
        final List<String> ids = _splitCommunicationId(communicationId);

        completer.complete(Message(messageType: ids.first, messageId: ids.last, payload: 'Timeout exceeded (${duration.inSeconds}s)', isError: true));
      }
    });
  }

  Future<void> _onConnectionState(RTCPeerConnectionState connectionState) async {
    log('ON CONNECTION STATE [$_isBackend]: "${connectionState.name}"');
    if (connectionState == RTCPeerConnectionState.RTCPeerConnectionStateClosed) {
      await _softDispose();
      onDispose(id);
    }
  }

  void _onIceGatheringState(RTCIceGatheringState iceGatheringState) => log('ON GATHERING STATE [$_isBackend]: "${iceGatheringState.name}"');

  void _onSignalingState(RTCSignalingState signalingState) => log('ON SIGNALING STATE [$_isBackend]: "${signalingState.name}"');

  void _onDataChannelState(RTCDataChannelState dataChannelState) => log('ON DATA CHANNEL STATE [$_isBackend]: ${dataChannelState.name}');

  void _onRenegotiationNeeded() => log('ON RENEGOTIATION NEEDED');

  void _initListeners() {
    peer.onIceCandidate = _onIceCandidate;
    peer.onConnectionState = _onConnectionState;
    peer.onIceGatheringState = _onIceGatheringState;
    peer.onSignalingState = _onSignalingState;
    peer.onRenegotiationNeeded = _onRenegotiationNeeded;
  }

  void _initDataChannelListener() => peer.onDataChannel = _onDataChannel;

  String _createCommunicationId({required String messageType, required String messageId}) {
    return '$messageType:$messageId';
  }

  /// ? First is [messageType] and the second is [messageId]
  List<String> _splitCommunicationId(String communicationId) {
    return communicationId.split(':');
  }
}

class WebRTCServiceFactory {
  factory WebRTCServiceFactory({
    required CloudDb dbProvider,
    required ValueChanged<String> onDispose,
  }) {
    return _instance ??= WebRTCServiceFactory._(dbProvider: dbProvider, onDispose: onDispose);
  }

  WebRTCServiceFactory._({
    required this.dbProvider,
    required this.onDispose,
  });

  static WebRTCServiceFactory? _instance;

  final CloudDb dbProvider;
  final ValueChanged<String> onDispose;

  WebRTCService create() => WebRTCService._(
        id: generateEventHash(),
        cloudDb: dbProvider,
        onDispose: onDispose,
      );
}
