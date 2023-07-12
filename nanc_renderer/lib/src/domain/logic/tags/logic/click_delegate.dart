import 'dart:async';

import 'package:config/config.dart';
import 'package:flutter/material.dart';

class ClickDelegate extends InheritedWidget {
  const ClickDelegate({
    required super.child,
    this.handlers = const [],
    super.key,
  });

  // ignore: prefer_constructors_over_static_methods
  static ClickDelegate of(BuildContext context) {
    final ClickDelegate? delegate = context.dependOnInheritedWidgetOfExactType<ClickDelegate>();
    if (delegate == null) {
      return const ClickDelegate(child: SizedBox());
    }
    return delegate;
  }

  Future<void> onPressed(BuildContext context, String event) async {
    for (final ClickHandler handler in handlers) {
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

  final List<ClickHandler> handlers;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
