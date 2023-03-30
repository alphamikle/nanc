import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/divider/divider_arguments.dart';

TagRenderer dividerRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_diving_scuba_flag,
    tag: 'divider',
    pattern: RegExp(r'<divider.*/>'),
    endPattern: null,
    description: TagDescription(
      description: '''
# Divider

Divider is a custom widget designed to add some empty space to your UI.

In general, you can use the Divider to achieve the same behavior as Padding, but without nesting.
''',
      arguments: [
        heightArg(),
        widthArg(),
      ],
      properties: [],
    ),
    example: '''
<container width="300" height="600" color="#457FDA">
  <column>
    <container width="100" height="100" color="#7BDA45">
    </container>
    <divider height="50"/>
    <padding bottom="50">
      <container width="100" height="100" color="#DA9745">
      </container>
    </padding>
    <container width="100" height="100" color="#7BDA45">
    </container>
  </column>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final DividerArguments arguments = DividerArguments.fromJson(element.attributes);

      return SizedBox(
        height: arguments.height ?? 0,
        width: arguments.width ?? 0,
      );
    },
  );
}
