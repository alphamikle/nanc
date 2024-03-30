import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

class KitTooltip extends StatelessWidget {
  const KitTooltip({
    required this.text,
    required this.child,
    this.disabled = false,
    super.key,
  })  : content = const SizedBox.shrink(),
        isRich = false;

  const KitTooltip.rich({
    required this.content,
    required this.child,
    this.disabled = false,
    super.key,
  })  : text = '',
        isRich = true;

  final Widget child;
  final Widget content;
  final String text;
  final bool disabled;
  final bool isRich;

  @override
  Widget build(BuildContext context) {
    final TooltipThemeData tooltipTheme = context.theme.tooltipTheme;

    if (disabled) {
      return child;
    }
    if (isRich) {
      return Tooltip(
        richMessage: WidgetSpan(
          style: tooltipTheme.textStyle ?? DefaultTextStyle.of(context).style,
          child: content,
        ),
        waitDuration: const Duration(seconds: 1),
        child: child,
      );
    }

    return Tooltip(
      message: text,
      waitDuration: const Duration(seconds: 1),
      child: child,
    );
  }
}
