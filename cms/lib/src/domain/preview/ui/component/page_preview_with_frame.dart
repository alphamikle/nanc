import 'package:cms/src/domain/preview/ui/component/page_preview.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class PagePreviewWithFrame extends StatelessWidget {
  const PagePreviewWithFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: Devices.ios.iPhone13,
      screen: const Scaffold(
        backgroundColor: Colors.white,
        body: PagePreview(),
      ),
    );
  }
}
