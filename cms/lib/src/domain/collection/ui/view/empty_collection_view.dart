import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/animations/robot_cleaner.dart';
import '../../../../service/routing/endpoints.dart';

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
                onPressed: () => context.go(Endpoints.createModel.segment()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
