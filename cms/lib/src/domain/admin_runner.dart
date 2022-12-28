import 'dart:async';

import 'package:cms/src/domain/collection/logic/logic/provider/page_list_api.dart';
import 'package:cms/src/domain/flutter_admin.dart';
import 'package:cms/src/domain/model/logic/entity/model_model.dart';
import 'package:cms/src/domain/page/logic/provider/entity_page_api.dart';
import 'package:cms/src/domain/wrapper/admin_wrapper.dart';
import 'package:cms/src/service/config/admin_config.dart';
import 'package:cms/src/service/errors/error_wrapper.dart';
import 'package:fields/fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

const Set<String> _skippingErrors = {
  'rendering library',
};

Future<void> adminRunner({
  required List<Model> models,
  required PageListApi pageListApi,
  required PageApi pageApi,
  AdminConfig? config,
  AdminWrapperBuilder? wrapperBuilder,
}) async {
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
    FlutterAdmin(
      models: [
        ...models,
        modelModel,
        structureModel,
      ],
      pageListApi: pageListApi,
      pageApi: pageApi,
      config: config ??
          const AdminConfig(
            limitPerPageParameterName: 'limit',
            pageNumberParameterName: 'page',
          ),
      errorStreamController: errorStreamController,
      wrapperBuilder: wrapperBuilder,
    ),
  );
}
