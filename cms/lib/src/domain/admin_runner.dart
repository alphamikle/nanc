import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';

import '../service/errors/human_exception.dart';
import 'app.dart';

const Set<String> _skippingErrors = {
  'rendering library',
};

Future<void> adminRunner(CmsConfig config) async {
  /// ? This stream closes in the [FlutterAdmin] widget
  /// ignore:close_sinks
  final StreamController<HumanException> errorStreamController = StreamController.broadcast();

  FlutterError.onError = (FlutterErrorDetails details) {
    if (_skippingErrors.contains(details.library)) {
      return;
    }
    if (details.exception is HumanException) {
      errorStreamController.add(details.exception as HumanException);
    } else {
      errorStreamController.add(HumanException(
        humanMessage: 'Layout Error',
        originalMessage: details.exception.toString(),
        stackTrace: details.stack,
      ));
    }
    debugPrintStack(stackTrace: details.stack, label: details.exception.toString());
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    if (error is HumanException) {
      errorStreamController.add(error);
    } else {
      errorStreamController.add(HumanException(
        humanMessage: 'Logical Error',
        originalMessage: error.toString(),
        stackTrace: stack,
      ));
    }
    debugPrintStack(stackTrace: stack, label: error.toString());
    return false;
  };

  runApp(
    App(
      config: config,
      errorStreamController: errorStreamController,
    ),
  );
}
