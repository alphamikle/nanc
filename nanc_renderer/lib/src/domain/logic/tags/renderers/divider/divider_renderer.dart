import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'divider_arguments.dart';

TagRenderer dividerRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_diving_scuba_flag,
    tagType: TagType.widget,
    tag: 'divider',
    description: TagDescription(
      description: '''
# [Divider](https://api.flutter.dev/flutter/material/Divider-class.html)

A thin horizontal line, with padding on either side.

In the Material Design language, this represents a divider. Dividers can be used in lists, Drawers, and elsewhere to separate content.
''',
      arguments: [
        heightArgument(),
        widthArgument(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <divider height="50"/>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final DividerArguments arguments = DividerArguments.fromJson(element.attributes);

      return Divider(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        height: arguments.height,
        color: arguments.color,
        endIndent: arguments.endIndent,
        indent: arguments.indent,
        thickness: arguments.thickness,
      );
    },
  );
}
