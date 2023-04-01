import 'package:additions/additions.dart';
import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

class DataRepository {
  const DataRepository({
    required this.clickHandlers,
    required this.renderers,
    required this.imageLoadingBuilder,
    required this.imageErrorBuilder,
    required this.imageFrameBuilder,
  });

  final List<RichClickHandler> clickHandlers;
  final List<TagRenderer> renderers;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
}
