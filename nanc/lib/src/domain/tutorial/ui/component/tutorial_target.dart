import 'package:flutter/material.dart';

class TutorialTarget extends StatelessWidget {
  const TutorialTarget({
    required this.showcaseKey,
    required this.child,
    this.text,
    this.widget,
    this.height,
    this.width,
    this.borderRadius,
    super.key,
  }) : assert((text != null && text != '') || widget != null);

  final GlobalKey showcaseKey;
  final Widget child;
  final String? text;
  final Widget? widget;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  bool get isTextTutorial => text != null && text != '';

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
