import 'package:cms/src/service/tools/assets_loader.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Lights extends StatefulWidget {
  const Lights({super.key});

  @override
  State<Lights> createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  late final RiveAnimationController controller = SimpleAnimation('Animation 1');

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      prepareAssetPath('assets/animations/lights_transparent_rive.riv'),
      controllers: [
        controller,
      ],
      fit: BoxFit.fitWidth,
    );
  }
}
