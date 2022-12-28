import 'package:flutter/material.dart';

mixin AnimatedState<T extends StatefulWidget> on SingleTickerProviderStateMixin<T> {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: animationDuration,
    reverseDuration: reverseDuration,
    debugLabel: runtimeType.toString(),
  );
  late final Animation<double> animation = CurvedAnimation(parent: animationController, curve: animationCurve);

  Duration get animationDuration;
  Duration get reverseDuration => animationDuration;
  Curve get animationCurve;

  double get value => animation.value;
  double get invertedValue => animation.invertedValue;

  Future<void> forward({double? from}) async => animationController.forward(from: from);

  Future<void> animateBack([double to = 0]) async => animationController.animateBack(to);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

extension InvertedValue on Animation<double> {
  double get invertedValue => 1 - value;
}
