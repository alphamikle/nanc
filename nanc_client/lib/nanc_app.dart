import 'dart:io';

import 'package:additions/additions.dart';
import 'package:analytics/analytics.dart';
import 'package:cms/cms.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nanc_client/routing/routes.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
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
  void initState() {
    super.initState();
    Analytics.sendEvent(
      'START_APP',
      data: <String, String>{
        'kind': 'client',
        'platform': kIsWeb
            ? 'web'
            : Platform.isAndroid
                ? 'android'
                : 'ios',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      navigatorKey: widget.rootKey,
      routes: generateRoutes(context),
      title: 'Nanc Client',
      theme: themeBuilder(context),
      scrollBehavior: AlwaysTouchScrollBehavior(),
      builder: (BuildContext context, Widget child) {
        final double width = MediaQuery.of(context).size.width;
        final ClickActionHandler action = clickHandler(context: context, handlers: [
          browserLinksEventDemoHandler,
          snackbarDemoHandler,
          deeplinkEventDemoHandler,
          shareDemoHandler,
        ]);

        if (width > 500) {
          return DeviceFrame(
            device: Devices.ios.iPhone13,
            screen: ClickDelegate(
              onPressed: action,
              child: child,
            ),
          );
        }
        return ClickDelegate(
          onPressed: action,
          child: child,
        );
      },
    );
  }
}
