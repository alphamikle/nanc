import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../theme/kit_borders.dart';
import '../../theme/kit_colors.dart';

class KitIconContainer extends StatelessWidget {
  const KitIconContainer({
    required this.icon,
    required this.color,
    this.iconSize = 30,
    super.key,
  });

  final IconData icon;
  final Color? color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? context.theme.colorScheme.tertiary;

    return AspectRatio(
      aspectRatio: 0.85,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.o15,
          borderRadius: context.kitBorders.middleRadius,
          border: Border.all(
            color: color.o35!,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color.withOpacity(1),
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
