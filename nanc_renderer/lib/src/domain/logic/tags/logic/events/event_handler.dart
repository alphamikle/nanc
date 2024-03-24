import 'dart:async';

import 'package:flutter/material.dart';

import 'model/event.dart';

typedef EventTest = FutureOr<bool> Function(BuildContext context, Event event);
typedef Handler = FutureOr<void> Function(BuildContext context, Event event);

class EventHandler {
  const EventHandler({
    required this.test,
    required this.handler,
  });

  final EventTest test;
  final Handler handler;
}
