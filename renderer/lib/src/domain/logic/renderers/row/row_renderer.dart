import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/row_column_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/row/row_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer rowRenderer() {
  return TagRenderer(
    icon: IconPack.flu_table_insert_row_regular,
    tag: 'row',
    pattern: RegExp(r'<row.*>'),
    endPattern: RegExp(r'</row>'),
    description: TagDescription(
      description: '''
# [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)

A widget that displays its children in a horizontal array.

To cause a child to expand to fill the available horizontal space, wrap the child in an [Expanded](widgets/Expanded-class.html) widget.

The [Row](widgets/Row-class.html) widget does not scroll (and in general it is considered an error to have more children in a [Row](widgets/Row-class.html) than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a [ListView](widgets/ListView-class.html).

For a vertical variant, see [Column](widgets/Column-class.html).

If you only have one child, then consider using [Align](widgets/Align-class.html) or [Center](widgets/Center-class.html) to position the child.
''',
      arguments: [
        crossAxisAlignmentArg(),
        mainAxisSizeArg(),
        mainAxisAlignmentArg(),
        verticalDirectionArg(),
        textDirectionArg(),
        textBaselineArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <row>
    <expanded>
      <placeholder width="300" height="60"/>
    </expanded>
    <placeholder width="100"/>
    <placeholder width="200" height="100"/>
  </row>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final RowArguments arguments = RowArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Row(
        crossAxisAlignment: arguments.crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: arguments.mainAxisSize ?? MainAxisSize.max,
        mainAxisAlignment: arguments.mainAxisAlignment ?? MainAxisAlignment.start,
        verticalDirection: arguments.verticalDirection ?? VerticalDirection.down,
        textDirection: arguments.textDirection,
        textBaseline: arguments.textBaseline,
        children: extractor.children,
      );
    },
  );
}
