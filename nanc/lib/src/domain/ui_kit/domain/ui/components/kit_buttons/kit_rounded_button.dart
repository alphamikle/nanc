import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../logic/constants/gap.dart';
import '../../theme/kit_borders.dart';
import '../kit_ink_well.dart';
import '../kit_text.dart';

class KitRoundedButton extends StatelessWidget {
  const KitRoundedButton({
    this.child,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.expanded = false,
    super.key,
  }) : assert(child != null || text != null);

  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    Widget topping = child ??
        KitText(
          text: text!,
          style: DefaultTextStyle.of(context).style.copyWith(color: textColor ?? context.theme.colorScheme.onPrimary),
        );
    if (expanded) {
      topping = Center(child: topping);
    }

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: color ?? context.theme.colorScheme.primary,
        borderRadius: context.kitBorders.middleRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Gap.large),
        child: topping,
      ),
    );
    if (expanded) {
      content = Row(
        children: [
          Expanded(
            child: content,
          ),
        ],
      );
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: onPressed == null ? 0.75 : 1,
      child: Stack(
        children: [
          content,
          Positioned.fill(
            child: KitInkWell(
              borderRadius: context.kitBorders.middleRadius,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
