import 'package:additions/additions.dart';
import 'package:cms/cms.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:nanc_client/routing/routes.dart';
import 'package:rich_renderer/rich_renderer.dart' as rr;
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class NancApp extends StatefulWidget {
  const NancApp({
    required this.rootKey,
    super.key,
  });

  final RootKey rootKey;

  @override
  State<NancApp> createState() => _NancAppState();
}

class _NancAppState extends State<NancApp> {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      navigatorKey: widget.rootKey,
      routes: generateRoutes(context),
      title: 'NANC Client App',
      theme: themeBuilder(context),
      scrollBehavior: AlwaysTouchScrollBehavior(),
      builder: (BuildContext context, Widget child) {
        final double width = MediaQuery.of(context).size.width;
        final rr.Action action = clickHandler(context: context, handlers: [
          browserLinksEventDemoHandler,
          snackbarDemoHandler,
          deeplinkEventDemoHandler,
          shareDemoHandler,
        ]);

        if (width > 500) {
          return DeviceFrame(
            device: Devices.ios.iPhone13,
            screen: rr.ClickDelegate(
              onPressed: action,
              child: child,
            ),
          );
        }
        return rr.ClickDelegate(
          onPressed: action,
          child: child,
        );
      },
    );
  }
}
