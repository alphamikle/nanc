import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components.dart';

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        if (components().isNotEmpty) components().toCategory(),
      ],
      addons: configureMaterialAddons(
        themeSetting: MaterialThemeSetting.firstAsSelected(
          themes: [
            WidgetbookTheme(name: 'Default', data: themeBuilder(context)),
          ],
        ),
        textScaleSetting: TextScaleSetting(
          activeTextScale: 1,
          textScales: [
            1,
          ],
        ),
        localizationSetting: LocalizationSetting(
          activeLocale: const Locale('en'),
          locales: [
            const Locale('en'),
          ],
          localizationsDelegates: [],
        ),
        frameSetting: FrameSetting.firstAsSelected(
          frames: [
            DefaultDeviceFrame(
              setting: DeviceSetting(
                activeDevice: Apple.iPhone13,
                devices: [
                  Apple.iPhone13,
                ],
              ),
            ),
          ],
        ),
      ),
      appInfo: AppInfo(name: 'Nanc Storybook'),
    );
  }
}
