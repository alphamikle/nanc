import 'package:flutter/material.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';

const double _kFieldHelperHeight = 24;

class KitButtonFieldWrapper extends StatelessWidget {
  const KitButtonFieldWrapper({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: GestureDetector(
            onTap: onPressed,
            child: const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ColoredBox(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: _kFieldHelperHeight,
          child: KitInkWell(onPressed: onPressed),
        )
      ],
    );
  }
}
