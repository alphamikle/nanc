import 'package:additions/additions.dart';
import 'package:flutter/material.dart';
import 'package:rich_renderer/rich_renderer.dart';

class DataRepository {
  const DataRepository({
    required this.clickHandlers,
    required this.renderers,
    required this.imageLoadingBuilder,
    required this.imageErrorBuilder,
  });

  final List<RichClickHandler> clickHandlers;
  final List<TagRendererFactory> renderers;
  final ImageLoadingBuilder imageLoadingBuilder;
  final ImageErrorWidgetBuilder imageErrorBuilder;
}
