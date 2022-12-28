import 'package:flutter/material.dart';
import 'package:rich_renderer/src/logic/image_builder_delegate.dart';

class SmartImage extends StatelessWidget {
  const SmartImage({
    required this.ref,
    this.color,
    this.width,
    this.height,
    this.fit,
    super.key,
  });

  final String ref;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  bool get isNetwork => ref.startsWith('http') || ref.contains('://');

  @override
  Widget build(BuildContext context) {
    final ImageBuilderDelegate builderDelegate = ImageBuilderDelegate.of(context);

    if (isNetwork) {
      return Image.network(
        ref,
        color: color,
        width: width,
        height: height,
        fit: fit,
        cacheHeight: height?.toInt(),
        cacheWidth: width?.toInt(),
        loadingBuilder: builderDelegate.loadingBuilder,
        errorBuilder: builderDelegate.errorBuilder,
      );
    }

    return Image.asset(
      ref,
      color: color,
      width: width,
      height: height,
      fit: fit,
      cacheHeight: height?.toInt(),
      cacheWidth: width?.toInt(),
      errorBuilder: builderDelegate.errorBuilder,
    );
  }
}
