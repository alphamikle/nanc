import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'icon_arguments.dart';

TagRenderer iconRenderer() {
  return TagRenderer(
    icon: IconPack.flu_paint_brush_regular,
    tagType: TagType.widget,
    tag: 'icon',
    description: TagDescription(
      description: '''
# [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)

A graphical icon widget drawn with a glyph from a font described in an [IconData](widgets/IconData-class.html) such as material's predefined [IconData](widgets/IconData-class.html)s in [Icons](material/Icons-class.html).

Icons are not interactive. For an interactive icon, consider material's [IconButton](material/IconButton-class.html).

There must be an ambient [Directionality](widgets/Directionality-class.html) widget when using [Icon](widgets/Icon-class.html). Typically this is introduced automatically by the [WidgetsApp](widgets/WidgetsApp-class.html) or [MaterialApp](material/MaterialApp-class.html).

This widget assumes that the rendered icon is squared. Non-squared icons may render incorrectly.

> Nanc currently contains several tens of thousands of built-in icons that can cover most needs. To see the whole list of available icons - click the "Icons" button, in the upper right corner of the UI-editor.
>
> Also, Nanc allows you to use your own custom icons, which is possible when using Nanc compiled from sources.
''',
      arguments: [
        iconArgument(name: 'icon'),
        colorArgument(name: 'color'),
        sizeArgument(),
        doubleArgument(name: 'weight'),
        doubleArgument(name: 'fill'),
        doubleArgument(name: 'opticalSize'),
      ],
      properties: [
        shadowProp(name: shadow),
      ],
    ),
    example: '''
<container width="300" height="60" color="#457FDA">
  <center>
    <icon icon="mdi_draw_pen" color="#FFF" size="128"/>
  </center>
</container>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final IconArguments arguments = IconArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (arguments.icon == null) {
        return const SizedBox();
      }

      return Icon(
        arguments.icon,
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        color: arguments.color,
        size: arguments.size,
        weight: arguments.weight,
        fill: arguments.fill,
        opticalSize: arguments.opticalSize,
        shadows: extractor.getProperties(shadow),
      );
    },
  );
}
