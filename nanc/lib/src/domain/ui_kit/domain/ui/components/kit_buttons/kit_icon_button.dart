import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../kit_ink_well.dart';

class KitIconButton extends StatelessWidget {
  const KitIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.iconSize = 30,
    this.rounder = 4,
    this.padding = const EdgeInsets.all(4),
    super.key,
  }) : square = false;

  const KitIconButton.square({
    required this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.iconSize = 30,
    this.rounder = 4,
    this.padding = const EdgeInsets.all(4),
    super.key,
  }) : square = true;

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? iconColor;
  final double iconSize;
  final double rounder;
  final EdgeInsets padding;
  final bool square;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.all(Radius.circular(max(rounder, iconSize / 2 - rounder)));
    final Color backgroundColor = color ?? context.theme.colorScheme.primaryContainer;
    final Color iconColor = this.iconColor ?? context.theme.colorScheme.onPrimary;
    final Widget widget = Stack(
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
    if (square) {
      return AspectRatio(
        aspectRatio: 1,
        child: widget,
      );
    }
    return widget;
  }
}
