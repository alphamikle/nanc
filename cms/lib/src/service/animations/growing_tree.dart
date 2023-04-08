import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../tools/assets_loader.dart';

class GrowingTree extends StatefulWidget {
  const GrowingTree({
    super.key,
  });

  @override
  State<GrowingTree> createState() => _GrowingTreeState();
}

class _GrowingTreeState extends State<GrowingTree> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.linear;

  @override
  Duration get animationDuration => const Duration(seconds: 600);

  @override
  Animation<double> get animation => Tween<double>(begin: 0, end: 100).animate(super.animation);

  bool get isPlaying => controller.isActive;
  bool initialized = false;

  late final Artboard artBoard;
  late final StateMachineController controller;
  SMIInput<double>? input;

  void animationListener() {
    final double value = animation.value;
    input?.value = value;
  }

  Future<void> init() async {
    final ByteData data = await rootBundle.load(prepareAssetPath('assets/animations/tree_demo_transparent_rive.riv'));
    final RiveFile file = RiveFile.import(data);
    artBoard = file.mainArtboard;
    final controller = StateMachineController.fromArtboard(artBoard, 'State Machine 1');
    if (controller != null) {
      this.controller = controller;
      artBoard.addController(controller);
      input = controller.findInput('input');
      input?.value = 0;
    }
    initialized = true;
    safeSetState();
    await forward();
  }

  @override
  void initState() {
    super.initState();
    unawaited(init());
    animationController.addListener(animationListener);
  }

  @override
  void dispose() {
    animationController.removeListener(animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      return const SizedBox.shrink();
    }
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        double opacity = (value - 0.25) / 10;
        if (opacity < 0) {
          opacity = 0;
        }
        if (opacity > 1) {
          return child!;
        }

        return Opacity(
          opacity: opacity,
          child: value < 0.25 ? const SizedBox.shrink() : child!,
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -200,
            bottom: -16,
            height: 1000,
            width: 1000,
            child: Rive(
              artboard: artBoard,
            ),
          ),
        ],
      ),
    );
  }
}
