import 'dart:async';

import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    this.delay = Duration.zero,
    this.curve,
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve? curve;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  late final Animation<double> opacity = CurvedAnimation(
    parent: controller,
    curve: widget.curve ?? Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    unawaited(Future<void>.delayed(widget.delay).then((_) {
      if (mounted) {
        controller.forward();
      }
    }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: widget.child,
    );
  }
}
