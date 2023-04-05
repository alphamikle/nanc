import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../service/scroll/always_touch_scroll_behavior.dart';
import 'page_preview.dart';

class PagePreviewWithFrame extends StatelessWidget {
  const PagePreviewWithFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
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
  }
}
