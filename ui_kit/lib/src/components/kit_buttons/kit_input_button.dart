import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';
import 'package:ui_kit/src/components/kit_tooltip.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';

class KitInputButton extends StatelessWidget {
  const KitInputButton({
    this.icon,
    this.child,
    this.iconColor,
    this.onPressed,
    this.tooltip,
    this.first = false,
    this.last = false,
    super.key,
  }) : assert(icon != null || child != null);

  final IconData? icon;
  final Widget? child;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final BorderRadius inputRadius = context.kitBorders.inputRadius;
    final double radiusValue = inputRadius.topLeft.x;
    final Radius effectiveRadius = Radius.circular(radiusValue * 0.8);

    final Widget button = SizedBox(
      width: 48,
      child: KitInkWell(
        borderRadius: first == false && last == false
            ? BorderRadius.zero
            : BorderRadius.only(
                topLeft: first ? effectiveRadius : Radius.zero,
                topRight: last ? effectiveRadius : Radius.zero,
                bottomRight: last ? effectiveRadius : Radius.zero,
                bottomLeft: first ? effectiveRadius : Radius.zero,
              ),
        onPressed: onPressed,
        child: child ??
            Icon(
              icon,
              color: iconColor ?? context.theme.inputDecorationTheme.iconColor,
            ),
      ),
    );
    if (tooltip != null && tooltip!.isNotEmpty) {
      return KitTooltip(text: tooltip!, child: button);
    }
    return button;
  }
}
