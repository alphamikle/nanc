import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';

class KitInkWell extends StatelessWidget {
  const KitInkWell({
    required this.onPressed,
    this.child,
    this.borderRadius,
    this.onHover,
    this.noReaction = false,
    this.mouseCursor,
    super.key,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onHover;
  final BorderRadius? borderRadius;
  final MouseCursor? mouseCursor;
  final bool noReaction;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = this.borderRadius ?? context.kitBorders.inputRadius;

    return Material(
      borderRadius: borderRadius,
      type: MaterialType.transparency,
      child: InkWell(
        mouseCursor: mouseCursor ?? (noReaction ? SystemMouseCursors.basic : null),
        onHover: onHover,
        borderRadius: borderRadius,
        onTap: onPressed,
        highlightColor: noReaction ? Colors.transparent : null,
        hoverColor: noReaction ? Colors.transparent : null,
        splashColor: noReaction ? Colors.transparent : null,
        focusColor: noReaction ? Colors.transparent : null,
        child: child ??
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: borderRadius,
              ),
            ),
      ),
    );
  }
}
