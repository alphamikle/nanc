import 'dart:async';

import 'package:flutter/material.dart';

abstract class Debouncer {
  static final Map<String, Timer> _timers = {};

  static Future<void> run(
    VoidCallback callback, {
    required String id,
    Duration delay = const Duration(milliseconds: 250),
  }) async {
    _timers[id]?.cancel();
    _timers[id] = Timer(delay, () {
      callback();
      _timers.remove(id);
    });
  }
}
