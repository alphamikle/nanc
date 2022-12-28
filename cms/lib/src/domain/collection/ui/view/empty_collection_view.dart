import 'package:cms/cms.dart';
import 'package:cms/src/service/animations/robot_cleaner.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class EmptyCollectionView extends StatelessWidget {
  const EmptyCollectionView({
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
                text: 'Create collection model',
                onPressed: () => context.vRouter.to(Routes.createModel()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
