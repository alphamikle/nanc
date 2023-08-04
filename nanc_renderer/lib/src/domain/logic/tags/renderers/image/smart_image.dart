import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:tools/tools.dart';

import '../../logic/image_builder_delegate.dart';

class SmartImage extends StatelessWidget {
  const SmartImage({
    required this.ref,
    this.color,
    this.width,
    this.height,
    this.fit,
    this.blurHash,
    this.useCache = true,
    super.key,
  });

  final String ref;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? blurHash;
  final bool useCache;

  bool get isNetwork => ref.startsWith('http') || ref.contains('://');

  bool get withBlurHash => blurHash != null && blurHash != '' && blurHash != 'null';

  Widget blurHashLoadingBuilder(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress != null) {
      logInfo('Loading progress of "$ref" is ${loadingProgress.cumulativeBytesLoaded / loadingProgress.cumulativeBytesLoaded}');
    } else {
      logInfo('Loading progress is null');
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: loadingProgress == null
          ? child
          : BlurHash(
              hash: blurHash!,
              imageFit: fit ?? BoxFit.fill,
            ),
    );
  }

  Widget cachedImageBuilder(BuildContext context, ImageProvider imageProvider) {
    final ImageBuilderDelegate builderDelegate = ImageBuilderDelegate.of(context);
    final Widget image = Image(
      image: imageProvider,
      fit: fit,
      width: width,
      color: color,
      height: height,
      frameBuilder: builderDelegate.frameBuilder,
      errorBuilder: builderDelegate.errorBuilder,
    );

    if (withBlurHash) {
      return blurHashLoadingBuilder(
        context,
        image,
        null,
      );
    }
    return image;
  }

  Widget cachedErrorBuilder(BuildContext context, String url, dynamic error) {
    final ImageBuilderDelegate builderDelegate = ImageBuilderDelegate.of(context);

    if (builderDelegate.errorBuilder != null) {
      return builderDelegate.errorBuilder!(context, error == null ? Exception(url) : error as Object, null);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final ImageBuilderDelegate builderDelegate = ImageBuilderDelegate.of(context);

    if (isNetwork) {
      if (useCache) {
        return CachedNetworkImage(
          imageUrl: ref,
          color: color,
          width: width,
          height: height,
          fit: fit,
          errorWidget: cachedErrorBuilder,
          imageBuilder: cachedImageBuilder,
          memCacheHeight: height?.toInt(),
          memCacheWidth: width?.toInt(),
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
          placeholderFadeInDuration: Duration.zero,
        );
      }
      return Image.network(
        ref,
        color: color,
        width: width,
        height: height,
        fit: fit,
        cacheHeight: height?.toInt(),
        cacheWidth: width?.toInt(),
        loadingBuilder: withBlurHash ? blurHashLoadingBuilder : builderDelegate.loadingBuilder,
        errorBuilder: builderDelegate.errorBuilder,
        frameBuilder: builderDelegate.frameBuilder,
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
      frameBuilder: builderDelegate.frameBuilder,
    );
  }
}
