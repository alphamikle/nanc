import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

class DataRepository {
  const DataRepository({
    required this.eventsHandlers,
    required this.renderers,
    required this.supportedFilters,
    required this.imageLoadingBuilder,
    required this.imageErrorBuilder,
    required this.imageFrameBuilder,
    required this.sliverChecker,
    required this.themeBuilder,
  });

  final List<EventHandler> eventsHandlers;
  final List<TagRenderer> renderers;
  final Set<QueryFieldType> supportedFilters;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final SliverChecker? sliverChecker;
  final ThemeDataBuilder? themeBuilder;
}
