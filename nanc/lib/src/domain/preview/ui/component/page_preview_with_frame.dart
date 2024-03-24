import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service/config/cms_config.dart';
import '../../../../service/init/data_repository.dart';
import '../../../../service/scroll/always_touch_scroll_behavior.dart';
import 'page_preview.dart';

class PagePreviewWithFrame extends StatelessWidget {
  const PagePreviewWithFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget screen = ScrollConfiguration(
      behavior: AlwaysTouchScrollBehavior(),
      child: DeviceFrame(
        device: Devices.ios.iPhone13,
        screen: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (BuildContext context) => const Scaffold(
                backgroundColor: Colors.white,
                body: PagePreview(),
              ),
            ),
          ],
        ),
      ),
    );

    final ThemeDataBuilder? themeBuilder = context.read<DataRepository>().themeBuilder;

    if (themeBuilder != null) {
      return Theme(
        data: themeBuilder(context),
        child: screen,
      );
    }

    return screen;
  }
}
