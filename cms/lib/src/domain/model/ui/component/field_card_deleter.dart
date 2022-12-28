import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

const double _kWidth = 20;
const double _kHeight = 20;
const double _kRadius = 20;
const double _minOpacity = 0.15;
const double _maxOpacity = 1;

class FieldCardDeleter extends StatelessWidget {
  const FieldCardDeleter({
    required this.child,
    required this.onDelete,
    super.key,
  });

  final Widget child;
  final VoidCallback? onDelete;

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
                  text: 'Delete',
                  child: _DeleterButton(
                    onPressed: onDelete!,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _DeleterButton extends StatefulWidget {
  const _DeleterButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<_DeleterButton> createState() => _DeleterButtonState();
}

class _DeleterButtonState extends State<_DeleterButton> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Duration get animationDuration => const Duration(milliseconds: 250);

  @override
  Curve get animationCurve => Curves.easeInOutQuart;

  // ignore: avoid_positional_boolean_parameters
  void toggleVisibility(bool isMouseOn) {
    if (isMouseOn) {
      forward();
    } else {
      animateBack(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius inkWellRadius = BorderRadius.only(
      topRight: (context.kitBorders.largeRadius.topRight.x * 0.88).toRadius,
      bottomLeft: (context.kitBorders.largeRadius.bottomLeft.x + _kRadius).toRadius,
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double height = _kHeight + (value * _kHeight);
        final double width = _kWidth + (value * _kWidth);
        final BorderRadius effectiveRadius = BorderRadius.only(
          topRight: (context.kitBorders.largeRadius.topRight.x * 0.88).toRadius,
          bottomLeft: (context.kitBorders.largeRadius.bottomLeft.x + (value * _kRadius)).toRadius,
        );

        return GestureDetector(
          child: Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.error.withOpacity((_maxOpacity - _minOpacity) * value + _minOpacity),
                  borderRadius: effectiveRadius,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 3),
                    child: Icon(
                      MdiIcons.deleteOutline,
                      color: context.theme.colorScheme.onError.withOpacity(value),
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
