import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import '../../theme/kit_borders.dart';
import '../kit_ink_well.dart';
import '../kit_text.dart';

class KitBigButton extends StatelessWidget {
  const KitBigButton({
    this.child,
    this.text,
    this.onPressed,
    this.color,
    super.key,
  }) : assert(child != null || text != null);

  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      color: context.theme.colorScheme.onSecondaryContainer,
    );

    return Stack(
      children: [
        DefaultTextStyle(
          style: style,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.secondaryContainer,
              borderRadius: context.kitBorders.extraRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Gap.large, horizontal: Gap.extra),
              child: child == null ? KitText(text: text!) : child!,
            ),
          ),
        ),
        Positioned.fill(
          child: KitInkWell(
            borderRadius: context.kitBorders.extraRadius,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
