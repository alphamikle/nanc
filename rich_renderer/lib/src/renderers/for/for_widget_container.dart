import 'package:flutter/material.dart';

class ForWidgetContainer extends StatelessWidget {
  const ForWidgetContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
