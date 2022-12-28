import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/divider/divider_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer dividerRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'divider',
    pattern: RegExp(r'<divider.*/>'),
    endPattern: null,
    example: '''
<description>
Divider

Like a Padding, but not wrap a widget

#### Parameters

<row>
  <expanded>
    <container color="41AF96">
    </container>
  </expanded>
  <divider width="8"/>
  <expanded>
    <container color="41AF96">
    </container>
  </expanded>
</row>
</description>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final DividerArguments arguments = DividerArguments.fromJson(element.attributes);

      return SizedBox(
        height: arguments.height ?? 0,
        width: arguments.width ?? 0,
      );
    },
  );
}
