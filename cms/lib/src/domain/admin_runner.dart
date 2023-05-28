import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import '../service/errors/errors_catcher.dart';
import '../service/errors/human_exception.dart';
import 'app.dart';

const Set<String> _skippingErrors = {
  'rendering library',
};

Future<void> adminRunner(CmsConfig config) async {
  /// ? This stream closes in the [App] widget
  /// ignore:close_sinks
  final StreamController<HumanException> errorStreamController = ErrorsCatcher.errorStreamController;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (_skippingErrors.contains(details.library)) {
      return;
    }
    if (details.exception is HumanException) {
      errorStreamController.add(details.exception as HumanException);
      logg.error(error: (details.exception as HumanException).humanMessage, stackTrace: (details.exception as HumanException).stackTrace);
    } else {
      errorStreamController.add(HumanException(
        humanMessage: 'Layout Error',
        originalMessage: details.exception.toString(),
        stackTrace: details.stack,
      ));
      logg.error(error: details.exception, stackTrace: details.stack);
    }
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stackTrace) {
    if (error is HumanException) {
      errorStreamController.add(error);
      logg.error(error: error.humanMessage, stackTrace: error.stackTrace);
    } else {
      errorStreamController.add(HumanException(
        humanMessage: 'Logical Error',
        originalMessage: error.toString(),
        stackTrace: stackTrace,
      ));
      logg.error(error: error, stackTrace: stackTrace);
    }
    return false;
  };

  runApp(
    App(
      config: config,
      errorStreamController: errorStreamController,
    ),
  );
}
