import 'package:flutter/material.dart';

class KitTooltip extends StatelessWidget {
  const KitTooltip({
    required this.text,
    required this.child,
    this.disabled = false,
    super.key,
  });

  final Widget child;
  final String text;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    if (disabled) {
      return child;
    }

    return Tooltip(
      message: text,
      waitDuration: const Duration(seconds: 1),
      child: child,
    );
  }
}
