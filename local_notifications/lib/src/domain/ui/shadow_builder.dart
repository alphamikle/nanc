import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class ShadowBuilder extends StatefulWidget {
  const ShadowBuilder({
    required this.child,
    required this.onClose,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final VoidCallback onClose;
  final Color? backgroundColor;

  @override
  State<ShadowBuilder> createState() => _ShadowBuilderState();
}

class _ShadowBuilderState extends State<ShadowBuilder> with SingleTickerProviderStateMixin, AnimatedState, AfterRender {
  @override
  Curve get animationCurve => Curves.ease;

  @override
  Duration get animationDuration => const Duration(milliseconds: 400);

  Future<void> close() async {
    await animateBack();
    widget.onClose();
  }

  @override
  Future<void> afterRender() async => forward();

  @override
  Widget build(BuildContext context) {
    final Color color = widget.backgroundColor ?? context.theme.colorScheme.shadow.withOpacity(0.25);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) => ColoredBox(
        color: color.withOpacity(value * color.opacity),
        child: child,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          KitInkWell(
            noReaction: true,
            borderRadius: BorderRadius.circular(0),
            onPressed: close,
          ),
          widget.child,
        ],
      ),
    );
  }
}
