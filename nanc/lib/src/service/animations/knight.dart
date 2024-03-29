import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../domain/ui_kit/domain/ui/animation/animated_state.dart';
import 'rive_state_machine_widget.dart';

const int _delay = 9;

class Knight extends StatefulWidget {
  const Knight({super.key});

  @override
  State<Knight> createState() => _KnightState();
}

class _KnightState extends State<Knight> with RiveStateMachine<Knight, bool>, SingleTickerProviderStateMixin, AnimatedState {
  @override
  String get filePath => 'assets/animations/knight_rive.riv';

  @override
  bool get stateMachineInitialValue => DateTime.now().hour >= 20 || DateTime.now().hour <= 5;

  @override
  String get stateMachineInputName => 'Night';

  @override
  String get stateMachine => 'DayNightSwitch';

  @override
  Curve get animationCurve => Curves.easeInQuint;

  @override
  Duration get animationDuration => const Duration(milliseconds: 1100);

  Future<void> visibilitySwitcher() async {
    if (stateMachineInitialValue == false) {
      animationController.value = 1;
      return;
    }
    unawaited(forward());
  }

  @override
  void initState() {
    super.initState();
    unawaited(visibilitySwitcher());
  }

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        Rive(
          fit: BoxFit.cover,
          useArtboardSize: true,
          alignment: Alignment.bottomLeft,
          artboard: artBoard,
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              final double blurStrength = 50 * (1 - animation.value);

              return BackdropFilter(
                filter: ImageFilter.blur(sigmaY: blurStrength, sigmaX: blurStrength),
                child: child,
              );
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
