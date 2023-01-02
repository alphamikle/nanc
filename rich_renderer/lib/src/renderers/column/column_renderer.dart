import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/column/column_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/row/row_arguments.dart';

const String description = '''
# [Column](https://api.flutter.dev/flutter/widgets/Column-class.html)

A widget that displays its children in a vertical array.

To cause a child to expand to fill the available vertical space, wrap the child in an [Expanded](widgets/Expanded-class.html) widget.

The [Column](widgets/Column-class.html) widget does not scroll (and in general it is considered an error to have more children in a [Column](widgets/Column-class.html) than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a [ListView](widgets/ListView-class.html).

For a horizontal variant, see [Row](widgets/Row-class.html).

If you only have one child, then consider using [Align](widgets/Align-class.html) or [Center](widgets/Center-class.html) to position the child.
''';

TagRenderer columnRenderer() {
  return TagRenderer(
    icon: IconPack.flu_table_insert_column_regular,
    tag: 'column',
    pattern: RegExp(r'<column.*>'),
    endPattern: RegExp('</column>'),
    description: TagDescription(
      description: description,
      arguments: [
        TagArgument('crossAxisAlignment', RowArguments.crossAxisAlignmentValues.toSet()),
        TagArgument('mainAxisAlignment', RowArguments.mainAxisAlignmentValues.toSet()),
        TagArgument('mainAxisSize', RowArguments.mainAxisSizeValues.toSet()),
        TagArgument('verticalDirection', RowArguments.verticalDirectionValues.toSet()),
        TagArgument('textDirection', RowArguments.textDirectionValues.toSet()),
        TagArgument('textBaseline', RowArguments.textBaselineValues.toSet()),
      ],
      properties: [],
    ),
    example: '''
<container width="300" height="600" color="#457FDA">
  <column>
    <container width="100" height="100" color="#7BDA45">
    </container>
    <container width="100" height="100" color="#DA9745">
    </container>
    <container width="100" height="100" color="#7BDA45">
    </container>
  </column>
</container>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ColumnArguments arguments = ColumnArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Column(
        crossAxisAlignment: arguments.crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: arguments.mainAxisSize ?? MainAxisSize.max,
        mainAxisAlignment: arguments.mainAxisAlignment ?? MainAxisAlignment.start,
        textBaseline: arguments.textBaseline,
        textDirection: arguments.textDirection,
        verticalDirection: arguments.verticalDirection ?? VerticalDirection.down,
        children: extractor.children,
      );
    },
  );
}
