import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/constants/gap.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitIconContainer extends StatelessWidget {
  const KitIconContainer({
    required this.icon,
    required this.color,
    super.key,
  });

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? context.theme.colorScheme.tertiary;

    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: color.filling,
        borderRadius: context.kitBorders.largeRadius,
        border: Border.all(
          color: color.border,
          width: 2,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Gap.large),
          child: Icon(
            icon,
            color: color.withOpacity(1),
            size: 30,
          ),
        ),
      ),
    );
  }
}
