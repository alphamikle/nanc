import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../ui_kit/domain/ui/animation/animated_state.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/theme/kit_borders.dart';

const double _kWidth = 20;
const double _kHeight = 20;
const double _kRadius = 20;
const double _minOpacity = 0.15;
const double _maxOpacity = 1;

const bool _kIsTooltipsDisabled = true;

class FieldCardDeleter extends StatelessWidget {
  const FieldCardDeleter({
    required this.child,
    required this.onDelete,
    required this.onExpand,
    super.key,
  });

  final Widget child;
  final VoidCallback? onDelete;
  final VoidCallback? onExpand;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (onDelete != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 1, right: 1),
                child: KitTooltip(
                  disabled: _kIsTooltipsDisabled,
                  text: 'Delete',
                  child: _CornerButton(
                    onPressed: onDelete!,
                    color: context.theme.colorScheme.error,
                    iconColor: context.theme.colorScheme.onError,
                    alignment: Alignment.topRight,
                    iconData: IconPack.mdi_delete_outline,
                  ),
                ),
              ),
            ),
          ),
        if (onExpand != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 1, right: 1),
                child: KitTooltip(
                  disabled: _kIsTooltipsDisabled,
                  text: 'Expand',
                  child: _CornerButton(
                    onPressed: onExpand!,
                    color: Colors.orange,
                    iconColor: context.theme.colorScheme.onError,
                    alignment: Alignment.bottomRight,
                    iconData: IconPack.flu_arrow_expand_filled,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _CornerButton extends StatefulWidget {
  const _CornerButton({
    required this.onPressed,
    required this.color,
    required this.iconColor,
    required this.iconData,
    required this.alignment,
  }) : assert(alignment == Alignment.topRight || alignment == Alignment.bottomRight);

  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  final IconData iconData;
  final Alignment alignment;

  @override
  State<_CornerButton> createState() => _CornerButtonState();
}

class _CornerButtonState extends State<_CornerButton> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Curve get animationCurve => Curves.easeInOutQuart;

  // ignore: avoid_positional_boolean_parameters
  void toggleVisibility(bool isMouseOn) {
    if (isMouseOn) {
      unawaited(forward());
    } else {
      unawaited(animateBack());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool topRightCorner = widget.alignment == Alignment.topRight;
    final bool bottomRightCorner = widget.alignment == Alignment.bottomRight;

    final BorderRadius inkWellRadius = BorderRadius.only(
      topRight: topRightCorner ? (context.kitBorders.largeRadius.topRight.x * 0.88).toRadius : Radius.zero,
      bottomLeft: topRightCorner ? (context.kitBorders.largeRadius.bottomLeft.x + _kRadius).toRadius : Radius.zero,
      bottomRight: bottomRightCorner ? (context.kitBorders.largeRadius.topRight.x * 0.88).toRadius : Radius.zero,
      topLeft: bottomRightCorner ? (context.kitBorders.largeRadius.bottomLeft.x + _kRadius).toRadius : Radius.zero,
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double height = _kHeight + (value * _kHeight);
        final double width = _kWidth + (value * _kWidth);
        final BorderRadius effectiveRadius = BorderRadius.only(
          topRight: inkWellRadius.topRight,
          bottomLeft: topRightCorner ? (context.kitBorders.largeRadius.bottomLeft.x + (value * _kRadius)).toRadius : Radius.zero,
          bottomRight: inkWellRadius.bottomRight,
          topLeft: bottomRightCorner ? (context.kitBorders.largeRadius.bottomLeft.x + (value * _kRadius)).toRadius : Radius.zero,
        );

        return GestureDetector(
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity((_maxOpacity - _minOpacity) * value + _minOpacity),
                  borderRadius: effectiveRadius,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3, bottom: topRightCorner ? 3 : 0, top: bottomRightCorner ? 3 : 0),
                    child: Icon(
                      widget.iconData,
                      color: widget.iconColor.withOpacity(value),
                    ),
                  ),
                ),
              ),
              child!,
            ],
          ),
        );
      },
      child: Positioned.fill(
        child: KitInkWell(
          onPressed: widget.onPressed,
          onHover: toggleVisibility,
          borderRadius: inkWellRadius,
        ),
      ),
    );
  }
}

extension ToRadius on double {
  Radius get toRadius {
    return Radius.circular(this);
  }
}
