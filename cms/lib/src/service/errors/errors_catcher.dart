import 'dart:async';

import 'package:tools/tools.dart';

import '../../../cms.dart';

abstract class ErrorsCatcher {
  /// ? This stream closes in the [App] widget
  /// ignore:close_sinks
  static final StreamController<HumanException> errorStreamController = StreamController.broadcast();

  static void catchZoneErrors(Object? error, StackTrace? stackTrace) {
    errorStreamController.add([error, stackTrace].toHumanException(error.toString()));
    logg.error(error: error, stackTrace: stackTrace);
  }
}
