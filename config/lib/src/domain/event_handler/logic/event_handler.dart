import 'dart:async';

import 'package:flutter/material.dart';

typedef EventTest = FutureOr<bool> Function(BuildContext context, String event);
typedef Handler = FutureOr<void> Function(BuildContext context, String event);

class EventHandler {
  const EventHandler({
    required this.test,
    required this.handler,
  });

  final EventTest test;
  final Handler handler;
}
