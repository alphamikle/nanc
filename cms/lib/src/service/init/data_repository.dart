import 'package:flutter/material.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

class DataRepository {
  const DataRepository({
    required this.clickHandlers,
    required this.renderers,
    required this.supportedFilters,
    required this.imageLoadingBuilder,
    required this.imageErrorBuilder,
    required this.imageFrameBuilder,
  });

  final List<ClickHandler> clickHandlers;
  final List<TagRenderer> renderers;
  final Set<QueryFieldType> supportedFilters;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
}
