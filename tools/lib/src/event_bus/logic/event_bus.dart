import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../tools/logg.dart';
import '../../tools/tools.dart';
import 'event_bus_request.dart';
import 'event_bus_response.dart';

typedef EventBusHandler<Response, Request> = FutureOr<Response> Function(Request request);

typedef Consumer = String;

class EventBus {
  final Map<Object, Map<Consumer, Function>> _handlers = {};
  final Map<String, Completer<EventBusResponse<dynamic>>> _responses = {};
  final StreamController<EventBusRequest<dynamic>> _requestEventsStreamController = StreamController();

  Stream<EventBusRequest<dynamic>> get _requestsStream => _requestEventsStreamController.stream.asBroadcastStream();
  StreamSubscription<EventBusRequest<dynamic>>? _requestsStreamSubscription;

  Future<Response> run<Response, Request>({
    required Object eventId,
    Request? request,
  }) async {
    final Completer<EventBusResponse<dynamic>> responseCompleter = Completer<EventBusResponse<dynamic>>();
    final String eventHash = generateEventHash();
    final EventBusRequest<Request> requestEvent = EventBusRequest(eventId: eventId, eventHash: eventHash, data: request);
    _responses[eventHash] = responseCompleter;
    _requestEventsStreamController.add(requestEvent);
    final EventBusResponse<dynamic> response = await responseCompleter.future;
    if (response.hasError) {
      if (response.error is Exception) {
        throw response.error! as Exception;
      } else if (response.error is Error) {
        throw response.error! as Error;
      } else {
        throw Exception('Unknown type of error: ${response.error}');
      }
    }
    return response.cast<Response>().sureData;
  }

  void send({required Object eventId, Object? request}) {
    final EventBusRequest<Object?> requestEvent = EventBusRequest(eventId: eventId, eventHash: '', data: request);
    _requestEventsStreamController.add(requestEvent);
  }

  void onEvent<Response, Request>({
    required Consumer consumer,
    required Object eventId,
    required EventBusHandler<Response, Request> handler,
  }) {
    if (!_handlers.containsKey(eventId)) {
      _handlers[eventId] = {};
    }
    _handlers[eventId]![consumer] = handler;
    _requestsStreamSubscription ??= _requestsStream.listen(_requestListener);
  }

  void unsubscribeFromEvent({required Consumer consumer, required Object eventId}) {
    if (_handlers.containsKey(eventId)) {
      _handlers[eventId]!.remove(consumer);
      if (_handlers[eventId]!.isEmpty) {
        _handlers.remove(eventId);
      }
    }
    if (_handlers.isEmpty) {
      unawaited(_requestsStreamSubscription?.cancel());
      _requestsStreamSubscription = null;
    }
  }

  void unsubscribeFromEvents({required Consumer consumer, required List<Object> eventsIds}) {
    for (final Object eventId in eventsIds) {
      unsubscribeFromEvent(consumer: consumer, eventId: eventId);
    }
  }

  Future<void> _requestListener(EventBusRequest<dynamic> request) async {
    final Map<Consumer, Function>? targetHandlers = _handlers[request.eventId];
    if (targetHandlers == null) {
      if (kDebugMode) {
        print('[WARNING] Handler for event ${request.eventId} not found');
      }
      return;
    }

    final List<MapEntry<Consumer, Function>> entries = [...targetHandlers.entries];

    for (final MapEntry<Consumer, Function> entry in entries) {
      EventBusResponse<dynamic> response;
      try {
        // ignore: avoid_dynamic_calls
        dynamic result = entry.value(request.data);
        if (result is Future) {
          result = await result;
        }
        response = EventBusResponse<dynamic>(data: result);
      } catch (error, stackTrace) {
        response = EventBusResponse<dynamic>(error: error);
        logError('Event bus error', error: error, stackTrace: stackTrace);
        rethrow;
      }

      /// It's means that we used [send] method, instead of [run]
      if (request.eventHash.isEmpty) {
        continue;
      }

      if (!_responses.containsKey(request.eventHash)) {
        logError('Response completer for event ${request.eventId} with hash ${request.eventHash} not found');
        continue;
      }

      final Completer<dynamic> targetCompleter = _responses[request.eventHash]!;
      Future<void>.delayed(const Duration(milliseconds: 100), () => _responses.remove(request.eventHash));
      targetCompleter.complete(response);
    }
  }
}
