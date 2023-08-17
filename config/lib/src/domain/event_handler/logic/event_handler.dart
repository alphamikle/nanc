import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

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
