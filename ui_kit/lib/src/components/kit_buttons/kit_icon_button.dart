import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitIconButton extends StatelessWidget {
  const KitIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.size = 36,
    this.rounder = 4,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? iconColor;
  final double size;
  final double rounder;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.all(Radius.circular(max(rounder, size / 2 - rounder)));
    final Color backgroundColor = (color ?? context.theme.colorScheme.secondaryContainer).translucent;
    final Color iconColor = (this.iconColor ?? context.theme.colorScheme.onPrimaryContainer).withOpacity(1);

    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: radius,
          ),
          child: Icon(
            icon,
            size: size,
            color: iconColor,
          ),
        ),
        Positioned.fill(
          child: KitInkWell(
            borderRadius: radius,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
