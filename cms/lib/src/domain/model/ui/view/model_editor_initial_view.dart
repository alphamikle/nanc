import 'package:cms/src/service/animations/robot_cleaner.dart';
import 'package:cms/src/service/routing/route_list.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class ModelEditorInitialView extends StatelessWidget {
  const ModelEditorInitialView({
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
                text: 'Create new model',
                onPressed: () => context.vRouter.to(Routes.createModel()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
