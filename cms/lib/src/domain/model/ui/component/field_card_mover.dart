import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

const double _kWidth = 40;
const double _kHeight = 40;
const double _kMinSize = 5;
const double _kRadius = 40;
const double _minOpacity = 0.25;
const double _maxOpacity = 1;

const bool _kIsTooltipsDisabled = true;

class FieldCardMover extends StatelessWidget {
  const FieldCardMover({
    required this.child,
    required this.onChange,
    this.availableDirections = AxisDirection.values,
    super.key,
  });

  final Widget child;
  final ValueChanged<AxisDirection> onChange;
  final List<AxisDirection> availableDirections;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (availableDirections.contains(AxisDirection.left))
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: KitTooltip(
                disabled: _kIsTooltipsDisabled,
                text: 'Shift on the left',
                child: _MoverButton(
                  direction: AxisDirection.left,
                  onPressed: onChange,
                ),
              ),
            ),
          ),
        if (availableDirections.contains(AxisDirection.up))
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: KitTooltip(
                disabled: _kIsTooltipsDisabled,
                text: 'Slide it up',
                child: _MoverButton(
                  direction: AxisDirection.up,
                  onPressed: onChange,
                ),
              ),
            ),
          ),
        if (availableDirections.contains(AxisDirection.right))
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: KitTooltip(
                disabled: _kIsTooltipsDisabled,
                text: 'Shift on the right',
                child: _MoverButton(
                  direction: AxisDirection.right,
                  onPressed: onChange,
                ),
              ),
            ),
          ),
        if (availableDirections.contains(AxisDirection.down))
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: KitTooltip(
                disabled: _kIsTooltipsDisabled,
                text: 'Slide it down',
                child: _MoverButton(
                  direction: AxisDirection.down,
                  onPressed: onChange,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _MoverButton extends StatefulWidget {
  const _MoverButton({
    required this.direction,
    required this.onPressed,
  });

  final AxisDirection direction;
  final ValueChanged<AxisDirection> onPressed;

  @override
  State<_MoverButton> createState() => _MoverButtonState();
}

class _MoverButtonState extends State<_MoverButton> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Curve get animationCurve => Curves.easeInOutQuart;

  AxisDirection get direction => widget.direction;

  bool get isVertical => widget.direction == AxisDirection.up || widget.direction == AxisDirection.down;

  bool get isHorizontal => isVertical == false;

  bool get hasTopLeftRadius => direction == AxisDirection.down || direction == AxisDirection.right;

  bool get hasTopRightRadius => direction == AxisDirection.down || direction == AxisDirection.left;

  bool get hasBottomRightRadius => direction == AxisDirection.up || direction == AxisDirection.left;

  bool get hasBottomLeftRadius => direction == AxisDirection.up || direction == AxisDirection.right;

  IconData generateIcon() {
    return {
      AxisDirection.left: IconPack.flu_chevron_left_filled,
      AxisDirection.up: IconPack.flu_chevron_up_filled,
      AxisDirection.right: IconPack.flu_chevron_right_filled,
      AxisDirection.down: IconPack.flu_chevron_down_filled,
    }[widget.direction]!;
  }

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
    const Radius zero = Radius.zero;
    final BorderRadius inkWellRadius = BorderRadius.only(
      topLeft: hasTopLeftRadius ? _kRadius.toRadius : zero,
      topRight: hasTopRightRadius ? _kRadius.toRadius : zero,
      bottomRight: hasBottomRightRadius ? _kRadius.toRadius : zero,
      bottomLeft: hasBottomLeftRadius ? _kRadius.toRadius : zero,
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double height = isVertical ? (_kHeight - _kMinSize) * value + _kMinSize : _kHeight;
        final double width = isVertical ? _kWidth : (_kWidth - _kMinSize) * value + _kMinSize;
        final Radius radius = ((_kRadius - _kMinSize) * value + _kMinSize).toRadius;
        final BorderRadius effectiveRadius = BorderRadius.only(
          topLeft: hasTopLeftRadius ? radius : zero,
          topRight: hasTopRightRadius ? radius : zero,
          bottomRight: hasBottomRightRadius ? radius : zero,
          bottomLeft: hasBottomLeftRadius ? radius : zero,
        );

        return GestureDetector(
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.tertiary.withOpacity((_maxOpacity - _minOpacity) * value + _minOpacity),
                  borderRadius: effectiveRadius,
                ),
                child: Center(
                  child: Icon(
                    generateIcon(),
                    color: context.theme.colorScheme.onTertiary.withOpacity(value),
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
          onPressed: () => widget.onPressed(direction),
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
