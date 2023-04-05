import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:ui_kit/ui_kit.dart';

import 'fade_in.dart';

Widget imageLoadingBuilder(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
) {
  if (loadingProgress != null && loadingProgress.expectedTotalBytes != null) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: KitCirclePreloader(),
    );
  }
  return child;
}

Widget imageErrorBuilder(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
) {
  return Padding(
    padding: const EdgeInsets.all(32),
    child: Icon(
      IconPack.flu_image_prohibited_regular,
      color: Theme.of(context).colorScheme.error,
      size: 32,
    ),
  );
}

// ignore: avoid_positional_boolean_parameters
Widget imageFrameBuilder(BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
  return FadeIn(
    child: child,
  );
}
