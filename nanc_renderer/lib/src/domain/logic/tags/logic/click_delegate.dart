import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ClickActionHandler = FutureOr<void> Function(String event);

class ClickDelegate extends InheritedWidget {
  const ClickDelegate({
    required super.child,
    required this.onPressed,
    super.key,
  });

  // ignore: prefer_constructors_over_static_methods
  static ClickDelegate of(BuildContext context) {
    final ClickDelegate? delegate = context.dependOnInheritedWidgetOfExactType<ClickDelegate>();
    if (delegate == null) {
      return ClickDelegate(
        child: const SizedBox(),
        onPressed: (String event) {
          if (kDebugMode) {
            print('ClickDelegate not found in the widget tree. Event "$event" was missed!');
          }
        },
      );
    }
    return delegate;
  }

  final ClickActionHandler onPressed;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
