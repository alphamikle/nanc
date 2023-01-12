import 'dart:async';

import 'package:flutter/material.dart';

typedef ClickEventTest = FutureOr<bool> Function(BuildContext context, String event);
typedef ClickEventHandler = FutureOr<void> Function(BuildContext context, String event);

class RichClickHandler {
  const RichClickHandler({
    required this.test,
    required this.handler,
  });

  final ClickEventTest test;
  final ClickEventHandler handler;
}
