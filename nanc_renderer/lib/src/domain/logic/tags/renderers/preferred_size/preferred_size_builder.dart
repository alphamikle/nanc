import 'package:flutter/material.dart';

class PreferredSizeBuilder extends StatelessWidget implements PreferredSizeWidget {
  const PreferredSizeBuilder({
    required this.preferredSize,
    required this.child,
    super.key,
  });

  @override
  final Size preferredSize;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      width: preferredSize.width,
      child: child,
    );
  }
}
