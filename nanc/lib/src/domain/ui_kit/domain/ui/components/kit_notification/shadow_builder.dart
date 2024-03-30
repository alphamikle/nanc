import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../animation/animated_state.dart';
import '../kit_ink_well.dart';

class ShadowBuilder extends StatefulWidget {
  const ShadowBuilder({
    required this.child,
    required this.onClose,
    required this.animationDuration,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final AsyncCallback onClose;
  final Duration animationDuration;
  final Color? backgroundColor;

  @override
  State<ShadowBuilder> createState() => ShadowBuilderState();
}

class ShadowBuilderState extends State<ShadowBuilder> with SingleTickerProviderStateMixin, AnimatedState, AfterRender {
  @override
  Curve get animationCurve => Curves.ease;

  @override
  Duration get animationDuration => widget.animationDuration;

  Future<void> close() async => animateBack();

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
            onPressed: widget.onClose,
          ),
          widget.child,
        ],
      ),
    );
  }
}
