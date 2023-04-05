import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../service/animations/robot_cleaner.dart';
import '../../../../service/routing/route_list.dart';

class SoloEmptyView extends StatelessWidget {
  const SoloEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KitViewSubContainer(
      child: Center(
        child: Stack(
          children: [
            const RobotCleaner(),
            Align(
              child: KitBigButton(
                text: 'Create solo model',
                onPressed: () => context.vRouter.to(Routes.createModel(query: {'solo': '${true}'})),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
