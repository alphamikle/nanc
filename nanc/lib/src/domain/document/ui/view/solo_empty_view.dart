import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../service/animations/robot_cleaner.dart';
import '../../../../service/routing/endpoints.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_big_button.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_sub_container.dart';

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
                onPressed: () => context.goNamed(
                  Endpoints.createModel.name,
                  queryParameters: {'solo': '${true}'},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
