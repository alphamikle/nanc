import 'dart:async';

import 'package:flutter/material.dart';

typedef EventTest = FutureOr<bool> Function(BuildContext context, String event);
typedef EventHandler = FutureOr<void> Function(BuildContext context, String event);

class ClickHandler {
  const ClickHandler({
    required this.test,
    required this.handler,
  });

  final EventTest test;
  final EventHandler handler;
}
