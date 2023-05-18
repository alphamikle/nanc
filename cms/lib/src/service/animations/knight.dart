import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tools/tools.dart';

import 'rive_state_machine_widget.dart';

const int _delay = 9;

class Knight extends StatefulWidget {
  const Knight({super.key});

  @override
  State<Knight> createState() => _KnightState();
}

class _KnightState extends State<Knight> with AfterRender, RiveStateMachine<Knight, bool> {
  Timer? switcherTimer;

  @override
  String get filePath => 'assets/animations/knight_rive.riv';

  @override
  bool get stateMachineInitialValue => false;

  @override
  String get stateMachineInputName => 'Night';

  @override
  String get stateMachine => 'DayNightSwitch';

  void dayNightSwitcher() {
    safeSetState(() {
      stateMachineInput?.value = !(stateMachineInput?.value ?? false);
    });
    switcherTimer = Timer(const Duration(seconds: _delay), dayNightSwitcher);
  }

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: _delay - 1), dayNightSwitcher);
  }

  @override
  void dispose() {
    switcherTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      return const SizedBox.shrink();
    }
    return Rive(
      fit: BoxFit.cover,
      useArtboardSize: true,
      alignment: Alignment.bottomLeft,
      artboard: artBoard,
    );
  }
}
