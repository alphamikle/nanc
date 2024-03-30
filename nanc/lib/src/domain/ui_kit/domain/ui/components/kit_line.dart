import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

class KitLine extends StatelessWidget {
  const KitLine({
    this.useGradient = true,
    this.opacity = 0.5,
    this.color,
    super.key,
  });

  final bool useGradient;
  final double opacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: 1.5,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: useGradient ? null : (color ?? context.theme.colorScheme.onSurface).withOpacity(opacity),
            gradient: useGradient
                ? LinearGradient(
                    stops: const [
                      0,
                      0.95,
                    ],
                    colors: [
                      (color ?? context.theme.colorScheme.onSurface).withOpacity(opacity),
                      Colors.transparent,
                    ],
                  )
                : null,
          ),
        );
      },
    );
  }
}
