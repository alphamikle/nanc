import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/icon/icon_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer iconRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'icon',
    pattern: RegExp(r'<icon.*/>'),
    endPattern: null,
    example: '''
<description>
Icon

A graphical icon widget drawn with a glyph from a font described in an IconData such as material's predefined IconDatas in Icons.

Icons are not interactive. For an interactive icon, consider material's IconButton.

There must be an ambient Directionality widget when using Icon.
Typically this is introduced automatically by the WidgetsApp or MaterialApp.

This widget assumes that the rendered icon is squared. Non-squared icons may render incorrectly.

https://api.flutter.dev/flutter/widgets/Icon-class.html
</description>

#### Parameters

<container width="300" height="300" color="E5ACA1">
  <center>
    <icon icon="imageArea" color="F03F1E" size="32"/>
  </center>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final IconArguments arguments = IconArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      if (arguments.icon == null || isSIcon(arguments.icon) == false) {
        return const SizedBox();
      }

      return SIcon(
        iconPath: arguments.icon!,
        // color: arguments.color,
        // size: arguments.size,
        // shadows: extractor.getProperties(shadow),
      );
    },
  );
}
