import 'package:cms/src/domain/roles/ui/component/multi_colored_text.dart';
import 'package:cms/src/service/tools/assets_loader.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class RolesView extends StatelessWidget {
  const RolesView({
    super.key,
  });

  // TODO(alphamikle): Сделать генератор двухцветного текста

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
                package: Env.isPackageMode ? 'cms' : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
