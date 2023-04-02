import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';
import 'package:ui_kit/src/constants/gap.dart';

class KitTextIndicatedButton extends StatefulWidget {
  const KitTextIndicatedButton({
    required this.text,
    this.isActive = false,
    this.onPressed,
    super.key,
  });

  final String text;
  final bool isActive;
  final VoidCallback? onPressed;

  @override
  State<KitTextIndicatedButton> createState() => _KitTextIndicatedButtonState();
}

class _KitTextIndicatedButtonState extends State<KitTextIndicatedButton> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    value: isActive ? 1 : 0,
  );
  late final CurvedAnimation animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart);
  late bool isActive = widget.isActive;

  @override
  void didUpdateWidget(KitTextIndicatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget && widget.isActive != isActive) {
      if (controller.isAnimating) {
        controller.stop();
      }
      if (widget.isActive) {
        controller.forward();
      } else {
        controller.animateBack(0);
      }
      isActive = widget.isActive;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color baseTextColor = context.theme.colorScheme.onTertiaryContainer.withOpacity(0.65);
    final Color color = context.theme.colorScheme.tertiary;
    final BorderRadius radius = BorderRadius.circular(12);

    return KitInkWell(
      borderRadius: radius,
      onPressed: widget.onPressed,
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double value = animation.value;
          final double reversedValue = 1 - value;

          return Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15 * value),
                  borderRadius: radius,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: Gap.large, top: Gap.regular, right: Gap.large, bottom: Gap.regular),
                  child: Center(
                    child: Text(
                      widget.text,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorTween(begin: baseTextColor, end: color).animate(animation).value,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: (20 * reversedValue + 16),
                right: (20 * reversedValue + 16),
                bottom: 0,
                height: 3,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: color.withOpacity(value),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
