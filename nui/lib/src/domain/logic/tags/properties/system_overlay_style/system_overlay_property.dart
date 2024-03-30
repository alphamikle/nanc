import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../nui.dart';
import 'system_overlay_arguments.dart';
import 'system_overlay_property_widget.dart';

PropertyTagRenderer<SystemUiOverlayStyle> systemOverlayProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final SystemOverlayArguments arguments = SystemOverlayArguments.fromJson(element.attributes);

      return SystemOverlayPropertyWidget(
        name: tag,
        property: SystemUiOverlayStyle(
          statusBarBrightness: arguments.statusBarBrightness,
          statusBarColor: arguments.statusBarColor,
          statusBarIconBrightness: arguments.statusBarIconBrightness,
          systemNavigationBarColor: arguments.systemNavigationBarColor,
          systemNavigationBarContrastEnforced: arguments.systemNavigationBarContrastEnforced,
          systemNavigationBarDividerColor: arguments.systemNavigationBarDividerColor,
          systemNavigationBarIconBrightness: arguments.systemNavigationBarIconBrightness,
          systemStatusBarContrastEnforced: arguments.systemStatusBarContrastEnforced,
        ),
      );
    },
  );
}
