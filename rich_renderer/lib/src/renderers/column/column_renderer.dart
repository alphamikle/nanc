import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/column/column_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/row/row_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/tags_arguments_extension.dart';

TagRenderer columnRenderer() {
  return TagRenderer(
    // TODO(alphamikle): Replace by real icon
    icon: IconPack.accessibilityBold,
    tag: 'column',
    pattern: RegExp(r'<column.*>'),
    endPattern: RegExp('</column>'),
    example: '''
<description>
Column

A widget that displays its children in a vertical array.

To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget.

The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.

For a horizontal variant, see Row.

If you only have one child, then consider using Align or Center to position the child.

https://api.flutter.dev/flutter/widgets/Column-class.html
</description>

#### Parameters

```
1.
<column ${RowArguments.crossAxisAlignmentValues.toArgs('crossAlignment')}>
  ...
</column>

2.
<column ${RowArguments.mainAxisSizeValues.toArgs('mainSize')}>
  ...
</column>

3.
<column ${RowArguments.mainAxisAlignmentValues.toArgs('mainAlignment')}>
  ...
</column>

4.
<column ${RowArguments.verticalDirectionValues.toArgs('direction')}>
  ...
</column>

5.
<column ${RowArguments.textDirectionValues.toArgs('textDirection')}>
  ...
</column>

6.
<column ${RowArguments.textBaselineValues.toArgs('textBaseline')}>
  ...
</column>
```

#### Example

<column crossAlignment="center">
  <padding bottom="16">
    <placeholder height="50"/>
  </padding>
  <placeholder height="80"/>
</column>
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
