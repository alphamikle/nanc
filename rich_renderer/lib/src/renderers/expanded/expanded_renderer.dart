import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/expanded/expanded_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer expandedRenderer() {
  return TagRenderer(
    icon: IconPack.flu_arrow_autofit_content_regular,
    tag: 'expanded',
    pattern: RegExp(r'<expanded.*>'),
    endPattern: RegExp('</expanded>'),
    example: '''
<description>
Expanded

A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.

Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space
along the main axis (e.g., horizontally for a Row or vertically for a Column).
If multiple children are expanded, the available space is divided among them according to the flex factor.

An Expanded widget must be a descendant of a Row, Column, or Flex,
and the path from the Expanded widget to its enclosing Row, Column,
or Flex must contain only StatelessWidgets or StatefulWidgets
(not other kinds of widgets, like RenderObjectWidgets).

https://api.flutter.dev/flutter/widgets/Expanded-class.html
</description>

#### Parameters

1. No params
<row>
  <placeholder height="50" width="100"/>
  <expanded>
    <placeholder height="60"/>
  </expanded>
</row>

2. Flex param used
<row>
  <expanded flex="2">
    <placeholder height="60"/>
  </expanded>
  <expanded>
    <placeholder height="60"/>
  </expanded>
</row>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ExpandedArguments arguments = ExpandedArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Expanded(
        flex: arguments.flex ?? 1,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
