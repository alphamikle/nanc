import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../theme/kit_colors.dart';
import '../kit_ink_well.dart';

class KitIconButton extends StatelessWidget {
  const KitIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.iconSize = 36,
    this.rounder = 4,
    this.padding = const EdgeInsets.all(4),
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? iconColor;
  final double iconSize;
  final double rounder;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.all(Radius.circular(max(rounder, iconSize / 2 - rounder)));
    final Color backgroundColor = (color ?? context.theme.colorScheme.secondaryContainer).o50;
    final Color iconColor = (this.iconColor ?? context.theme.colorScheme.onPrimaryContainer).withOpacity(1);

    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: radius,
          ),
          child: Padding(
            padding: padding,
            child: Center(
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
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
