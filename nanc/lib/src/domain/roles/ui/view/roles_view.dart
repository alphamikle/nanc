import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/config/constants.dart';
import '../../../../service/tools/assets_loader.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_sub_container.dart';
import '../component/multi_colored_text.dart';

class RolesView extends StatelessWidget {
  const RolesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KitViewSubContainer(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              prepareAssetPath('assets/animations/construction_lottie.json'),
            ),
            MultiColoredText(
              text: 'UNDER CONSTRUCTION',
              colors: [
                context.theme.colorScheme.primary.withOpacity(0.5),
                const Color.fromRGBO(0, 0, 0, 0.5),
              ],
              style: const TextStyle(
                fontFamily: 'BluePrintNonCommercial',
                fontSize: 36,
                package: kPackageName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
