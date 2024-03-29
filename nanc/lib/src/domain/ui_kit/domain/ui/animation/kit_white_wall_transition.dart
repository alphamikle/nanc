import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

class KitWhiteWallTransition extends StatelessWidget {
  const KitWhiteWallTransition({
    required this.animation,
    required this.child,
    super.key,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final bool stage1 = animation.value >= 0 && animation.value < 0.33;
        final bool stage2 = animation.value >= 0.33 && animation.value < 0.66;
        final bool stage3 = animation.value >= 0.66 && animation.value < 0.99;
        final bool stage4 = animation.value >= 0.99;

        if (stage4) {
          return child!;
        }

        final Color color = context.theme.colorScheme.surface.withOpacity(
          stage1 || stage2 || stage3 ? 1 : 1 - animation.value,
        );

        return Stack(
          children: [
            child!,
            Positioned.fill(
              child: ColoredBox(color: color),
            ),
          ],
        );
      },
      child: child,
    );
  }
}
