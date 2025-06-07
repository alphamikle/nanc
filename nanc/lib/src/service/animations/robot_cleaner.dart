import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../tools/assets_loader.dart';

class RobotCleaner extends StatefulWidget {
  const RobotCleaner({super.key});

  @override
  State<RobotCleaner> createState() => _RobotCleanerState();
}

class _RobotCleanerState extends State<RobotCleaner> with AutomaticKeepAliveClientMixin {
  late final RiveAnimationController<dynamic> robotController = SimpleAnimation('Test');
  late final RiveAnimationController<dynamic> dustController = SimpleAnimation('dust_fly');

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RiveAnimation.asset(
      prepareAssetPath('assets/animations/robo_cleaner_rive.riv'),
      controllers: [
        robotController,
        dustController,
      ],
    );
  }
}
