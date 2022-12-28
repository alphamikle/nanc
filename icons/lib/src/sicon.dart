import 'package:flutter/material.dart';
import 'package:icons/src/cached_scalable_image.dart';
import 'package:jovial_svg/jovial_svg.dart';

const double _kBaseSize = 24;

class SIcon extends StatelessWidget {
  const SIcon({
    required this.iconPath,
    this.size = 24,
    this.color,
    super.key,
  });

  final String iconPath;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ColorFilter? colorFilter = color == null ? null : ColorFilter.mode(color!, BlendMode.srcATop);
    if (CachedScalableImage.haveAsset(iconPath)) {
      final Widget scalableImageWidget = ScalableImageWidget(
        si: CachedScalableImage.get(iconPath),
        fit: BoxFit.cover,
        scale: size / _kBaseSize,
      );
      if (colorFilter == null) {
        return scalableImageWidget;
      }
      return ColorFiltered(
        colorFilter: colorFilter,
        child: scalableImageWidget,
      );
    }

    return FutureBuilder(
      // ignore: discarded_futures
      future: CachedScalableImage.create(iconPath),
      builder: (BuildContext context, AsyncSnapshot<ScalableImage?> snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: snapshot.hasData
              ? colorFilter == null
                  ? ScalableImageWidget(
                      si: snapshot.data!,
                      fit: BoxFit.cover,
                      scale: size / _kBaseSize,
                    )
                  : ColorFiltered(
                      colorFilter: colorFilter,
                      child: ScalableImageWidget(
                        si: snapshot.data!,
                        fit: BoxFit.cover,
                        scale: size / _kBaseSize,
                      ),
                    )
              : SizedBox(height: size, width: size),
        );
      },
    );
  }
}
