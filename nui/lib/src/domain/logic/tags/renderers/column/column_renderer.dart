import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import 'column_arguments.dart';

const String _description = '''
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
    tagType: TagType.widget,
    tag: 'column',
    description: TagDescription(
      description: _description,
      arguments: [
        crossAxisAlignmentArgument(),
        mainAxisAlignmentArgument(),
        mainAxisSizeArgument(),
        verticalDirectionArgument(),
        textDirectionArgument(),
        textBaselineArgument(),
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
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ColumnArguments arguments = ColumnArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Column(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
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
