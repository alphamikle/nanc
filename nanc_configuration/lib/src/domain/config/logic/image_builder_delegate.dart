import 'package:flutter/material.dart';

class ImageBuilderDelegate {
  const ImageBuilderDelegate({
    this.imageFrameBuilder,
    this.imageErrorWidgetBuilder,
    this.imageLoadingBuilder,
  });

  final ImageFrameBuilder? imageFrameBuilder;
  final ImageErrorWidgetBuilder? imageErrorWidgetBuilder;
  final ImageLoadingBuilder? imageLoadingBuilder;
}
