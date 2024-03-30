import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'default_event_handlers/data_storage_event_handler.dart';
import 'events/event_handler.dart';
import 'events/model/event.dart';

class EventDelegate extends InheritedWidget {
  const EventDelegate({
    required super.child,
    List<EventHandler> handlers = const [],
    super.key,
  }) : _handlers = handlers;

  final List<EventHandler> _handlers;

  List<EventHandler> get handlers {
    return [
      ..._handlers,
      dataStorageEventHandler,
    ];
  }

  // ignore: prefer_constructors_over_static_methods
  static EventDelegate of(BuildContext context) {
    final EventDelegate? delegate = context.dependOnInheritedWidgetOfExactType<EventDelegate>();
    if (delegate == null) {
      return const EventDelegate(child: SizedBox());
    }
    return delegate;
  }

  Future<void> onEvent(BuildContext context, Event event) async {
    for (final EventHandler handler in handlers) {
      // ignore: use_build_context_synchronously
      final FutureOr<bool> canHandleRaw = handler.test(context, event);
      bool canHandle = false;
      if (canHandleRaw is Future) {
        canHandle = await canHandleRaw;
      } else {
        canHandle = canHandleRaw;
      }
      if (canHandle) {
        // ignore: use_build_context_synchronously
        final FutureOr<void> resultRaw = handler.handler(context, event);
        if (resultRaw is Future) {
          await resultRaw;
        }
      }
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

AsyncCallback? handleEvent({required BuildContext context, String? event, MetaInfo? meta}) {
  if (event == null) {
    return null;
  }
  final EventDelegate delegate = EventDelegate.of(context);
  return () async => delegate.onEvent(context, Event(event: event, meta: meta));
}
