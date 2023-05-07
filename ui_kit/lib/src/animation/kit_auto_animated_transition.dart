import 'dart:async';

import 'package:flutter/material.dart';

import 'animated_state.dart';

typedef AutoTransitionBuilder = Widget Function(BuildContext context, AnimationController controller);

class KitAutoAnimatedTransition extends StatefulWidget {
  const KitAutoAnimatedTransition({
    required this.builder,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
    super.key,
  });

  final AutoTransitionBuilder builder;
  final Curve curve;
  final Duration duration;

  @override
  State<KitAutoAnimatedTransition> createState() => _KitAutoAnimatedTransitionState();
}

class _KitAutoAnimatedTransitionState extends State<KitAutoAnimatedTransition> with SingleTickerProviderStateMixin, AnimatedState<KitAutoAnimatedTransition> {
  @override
  Curve get animationCurve => widget.curve;

  @override
  Duration get animationDuration => widget.duration;

  @override
  void initState() {
    super.initState();
    unawaited(forward());
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, animationController);
  }
}
