import 'dart:async';

import 'package:flutter/material.dart';

class KitWaveSwitcher extends StatefulWidget {
  const KitWaveSwitcher({
    required this.firstChild,
    required this.secondChild,
    this.state = CrossFadeState.showFirst,
    this.duration = const Duration(milliseconds: 1000),
    this.startingPoint = FractionalOffset.center,
    this.curve = Curves.linear,
    this.once = false,
    this.autorun = false,
    super.key,
  });

  final Widget firstChild;
  final Widget secondChild;
  final CrossFadeState state;
  final Duration duration;
  final FractionalOffset startingPoint;
  final Curve curve;
  final bool once;
  final bool autorun;

  @override
  State<KitWaveSwitcher> createState() => _KitWaveSwitcherState();
}

class _KitWaveSwitcherState extends State<KitWaveSwitcher> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: widget.curve,
  );
  late CrossFadeState initialState = widget.state;
  late bool once = widget.once;
  late final bool autorun = widget.autorun;
  bool get showFirst => initialState == CrossFadeState.showFirst;
  Widget get first => widget.firstChild;
  Widget get second => widget.secondChild;
  bool get isAnimating => controller.isAnimating;
  bool isForward = false;
  bool switcherExist = false;

  Future<void> switchChildren() async {
    if (mounted == false) {
      return;
    }
    if (isAnimating && isForward) {
      isForward = false;
      await controller.animateBack(0);
      setState(() {
        switcherExist = false;
        initialState = widget.state;
      });
      return;
    }
    isForward = true;
    setState(() => switcherExist = true);
    await controller.forward();

    /// ? This behavior will be helpful, if you want to switch widgets only once,
    /// ? or you have some re-rendering artefacts, for example - with images
    if (once) {
      switcherExist = false;
      initialState = widget.state;
      isForward = false;
    } else {
      setState(() {
        switcherExist = false;
        initialState = widget.state;
      });
      isForward = false;
      controller.reset();
    }
  }

  void checkAutorun() {
    if (autorun) {
      once = true;
      unawaited(switchChildren());
    }
  }

  @override
  void didUpdateWidget(KitWaveSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      unawaited(switchChildren());
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    checkAutorun();
  }

  @override
  Widget build(BuildContext context) {
    if (switcherExist == false) {
      return showFirst ? first : second;
    }
    return Stack(
      children: [
        showFirst ? second : first,
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return _WaveAnimation(
              startingPoint: widget.startingPoint,
              value: animation.value,
              child: child!,
            );
          },
          child: showFirst ? first : second,
        ),
      ],
    );
  }
}

class _WaveAnimation extends StatelessWidget {
  const _WaveAnimation({
    required this.startingPoint,
    required this.value,
    required this.child,
  }) : assert(value >= 0 && value <= 1);

  final FractionalOffset startingPoint;
  final double value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return RadialGradient(
          colors: const [
            Colors.transparent,
            Colors.transparent,
            Colors.white,
            Colors.white,
          ],
          stops: const [
            0.0,
            0.5,
            0.5,
            1.0,
          ],
          center: startingPoint,
          radius: value * 5,
        ).createShader(rect);
      },
      child: child,
    );
  }
}
