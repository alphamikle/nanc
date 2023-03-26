import 'package:flutter/material.dart';

class KitIconButtonV2 extends StatelessWidget {
  const KitIconButtonV2({
    required this.icon,
    this.onPressed,
    this.color,
    this.iconColor,
    this.iconSize,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    // final Color iconColor = (this.iconColor ?? context.theme.colorScheme.onPrimaryContainer).withOpacity(1);

    return IconButton(
      onPressed: onPressed,
      color: color,
      iconSize: iconSize,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
