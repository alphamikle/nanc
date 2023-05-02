import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';

import '../service/errors/error_wrapper.dart';
import 'app.dart';

const Set<String> _skippingErrors = {
  'rendering library',
};

Future<void> adminRunner(CmsConfig config) async {
  /// ? This stream closes in the [FlutterAdmin] widget
  /// ignore:close_sinks
  final StreamController<ErrorWrapper> errorStreamController = StreamController.broadcast();

  FlutterError.onError = (FlutterErrorDetails details) {
    if (_skippingErrors.contains(details.library)) {
      return;
    }
    errorStreamController.add(ErrorWrapper(details.exception, details.stack));
    debugPrintStack(stackTrace: details.stack, label: details.exception.toString());
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorStreamController.add(ErrorWrapper(error, stack));
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
