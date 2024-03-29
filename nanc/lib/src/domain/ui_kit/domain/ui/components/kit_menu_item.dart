import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../logic/constants/gap.dart';
import 'kit_ink_well.dart';
import 'kit_text.dart';
import 'kit_tooltip.dart';

class KitMenuItem extends StatefulWidget {
  const KitMenuItem({
    required this.text,
    this.onPressed,
    this.isActive = false,
    this.counter,
    this.icon,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isActive;
  final int? counter;

  @override
  State<KitMenuItem> createState() => _KitMenuItemState();
}

class _KitMenuItemState extends State<KitMenuItem> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    value: isActive ? 1 : 0,
  );
  late final CurvedAnimation animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart);
  late bool isActive = widget.isActive;

  @override
  void didUpdateWidget(KitMenuItem oldWidget) {
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
    const BorderRadius radius = BorderRadius.only(
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),
    );

    return KitInkWell(
      borderRadius: radius,
      onPressed: widget.onPressed,
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double value = animation.value;
          final double reversedValue = 1 - value;
          final Color? textColor = ColorTween(begin: baseTextColor, end: color).animate(animation).value;

          return KitTooltip(
            text: widget.text,
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15 * value),
                    borderRadius: radius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: Gap.large, top: Gap.large, bottom: Gap.large),
                    child: Row(
                      children: [
                        Flexible(
                          child: Icon(
                            widget.icon,
                            color: textColor,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: Gap.regular),
                            child: KitText(
                              text: widget.text,
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: (20 * reversedValue + 8),
                  bottom: (20 * reversedValue + 8),
                  width: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color.withOpacity(value),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(3),
                        bottomRight: Radius.circular(3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
