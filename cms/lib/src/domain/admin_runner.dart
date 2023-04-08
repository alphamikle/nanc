import 'dart:async';

import 'package:additions/additions.dart';
import 'package:fields/fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import '../service/config/admin_config.dart';
import '../service/errors/error_wrapper.dart';
import 'app.dart';
import 'collection/logic/logic/provider/page_list_api.dart';
import 'page/logic/provider/entity_page_api.dart';
import 'wrapper/admin_wrapper.dart';

const Set<String> _skippingErrors = {
  'rendering library',
};

Future<void> adminRunner({
  required List<Model> models,
  required PageListApi pageListApi,
  required PageApi pageApi,
  List<TagRenderer> renderers = const [],
  List<RichClickHandler> clickHandlers = const [],
  AdminConfig? config,
  AdminWrapperBuilder? wrapperBuilder,
  ImageFrameBuilder? imageFrameBuilder,
  ImageErrorWidgetBuilder? imageErrorBuilder,
  ImageLoadingBuilder? imageLoadingBuilder,
  List<CustomFont> customFonts = const [],
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
    App(
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
      clickHandlers: clickHandlers,
      renderers: renderers,
      imageFrameBuilder: imageFrameBuilder,
      imageLoadingBuilder: imageLoadingBuilder,
      imageErrorBuilder: imageErrorBuilder,
      customFonts: customFonts,
    ),
  );
}
