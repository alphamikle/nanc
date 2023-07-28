import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
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
# Divider

Divider is a custom widget designed to add some empty space to your UI.
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
        height: arguments.height,
        color: arguments.color,
        endIndent: arguments.endIndent,
        indent: arguments.indent,
        thickness: arguments.thickness,
      );
    },
  );
}
