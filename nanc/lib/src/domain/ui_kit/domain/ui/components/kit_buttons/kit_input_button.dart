import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../theme/kit_borders.dart';
import '../kit_ink_well.dart';
import '../kit_inputs/kit_empty_input.dart';
import '../kit_tooltip.dart';

class KitInputButton extends StatelessWidget {
  const KitInputButton({
    this.icon,
    this.child,
    this.iconColor,
    this.onPressed,
    this.tooltip,
    this.first = false,
    this.last = false,
    this.embed = true,
    super.key,
  }) : assert(icon != null || child != null);

  final IconData? icon;
  final Widget? child;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool first;
  final bool last;
  final bool embed;

  @override
  Widget build(BuildContext context) {
    final BorderRadius inputRadius = context.kitBorders.inputRadius;
    final double radiusValue = inputRadius.topLeft.x;
    final Radius effectiveRadius = Radius.circular(radiusValue * 0.8);

    Widget button = SizedBox(
      height: embed ? null : 51,
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
      button = KitTooltip(text: tooltip!, child: button);
    }
    if (embed == false) {
      button = KitEmptyInput(
        child: button,
      );
    }
    return button;
  }
}
