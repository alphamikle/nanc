import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'safe_area_arguments.dart';

TagRenderer safeAreaRenderer() {
  return TagRenderer(
    icon: IconPack.flu_resize_large_regular,
    tagType: TagType.widget,
    tag: 'safeArea',
    description: TagDescription(
      description: '''
# [SafeArea](https://api.flutter.dev/flutter/widgets/SafeArea-class.html)

A widget that insets its child by sufficient padding to avoid intrusions by the operating system.

For example, this will indent the child by enough to avoid the status bar at the top of the screen.

It will also indent the child by the amount necessary to avoid The Notch on the iPhone X, or other similar creative physical features of the display.

When a [minimum](widgets/SafeArea/minimum.html) padding is specified, the greater of the minimum padding or the safe area padding will be applied.

See also:

*   [SliverSafeArea](widgets/SliverSafeArea-class.html), for insetting slivers to avoid operating system intrusions.
*   [Padding](widgets/Padding-class.html), for insetting widgets in general.
*   [MediaQuery](widgets/MediaQuery-class.html), from which the window padding is obtained.
*   [dart:ui.FlutterView.padding](dart-ui/FlutterView/padding.html), which reports the padding from the operating system.
''',
      arguments: [
        boolArgument(name: 'left'),
        boolArgument(name: 'top'),
        boolArgument(name: 'right'),
        boolArgument(name: 'bottom'),
        boolArgument(name: 'bottomViewPadding'),
      ],
      properties: [
        paddingProp(name: minimum),
      ],
    ),
    example: '''
<safeArea>
  <placeholder/>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SafeAreaArguments arguments = SafeAreaArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      final EdgeInsets? minimumPadding = extractor.getProperty(minimum);

      return SafeArea(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        left: arguments.left ?? true,
        top: arguments.top ?? true,
        right: arguments.right ?? true,
        bottom: arguments.bottom ?? true,
        maintainBottomViewPadding: arguments.bottomViewPadding ?? false,
        minimum: minimumPadding ?? EdgeInsets.zero,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
