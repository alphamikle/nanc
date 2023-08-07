import 'dart:async';

import 'package:config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventDelegate extends InheritedWidget {
  const EventDelegate({
    required super.child,
    this.handlers = const [],
    super.key,
  });

  final List<EventHandler> handlers;

  // ignore: prefer_constructors_over_static_methods
  static EventDelegate of(BuildContext context) {
    final EventDelegate? delegate = context.dependOnInheritedWidgetOfExactType<EventDelegate>();
    if (delegate == null) {
      return const EventDelegate(child: SizedBox());
    }
    return delegate;
  }

  Future<void> onEvent(BuildContext context, String event) async {
    for (final EventHandler handler in handlers) {
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

AsyncCallback? handleEvent(BuildContext context, String? event) {
  if (event == null) {
    return null;
  }
  final EventDelegate delegate = EventDelegate.of(context);
  return () async => delegate.onEvent(context, event);
}

String generateMetadata(String name, Object? metadata) {
  return '[[$name:::$metadata]]';
}
