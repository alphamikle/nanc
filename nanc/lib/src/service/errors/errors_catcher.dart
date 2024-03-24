import 'dart:async';

import 'package:tools/tools.dart';

import 'human_exception.dart';

abstract class ErrorsCatcher {
  /// ? This stream closes in the [App] widget
  /// ignore:close_sinks
  static final StreamController<HumanException> errorStreamController = StreamController.broadcast();

  static void catchZoneErrors(Object? error, StackTrace? stackTrace) {
    if (error is HumanException) {
      errorStreamController.add(error);
    } else {
      errorStreamController.add([error, stackTrace].toHumanException(error.toString()));
    }
    logError('Zone error catch', error: error, stackTrace: stackTrace);
  }
}
