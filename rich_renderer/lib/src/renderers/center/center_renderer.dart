import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/center/center_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String description = '''
# Center

A widget that centers its child within itself.

This widget will be as big as possible if its dimensions are constrained and [widthFactor](https://api.flutter.dev/flutter/widgets/Align/widthFactor.html) and [heightFactor](https://api.flutter.dev/flutter/widgets/Align/heightFactor.html) are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.

See also:

- [Align](https://api.flutter.dev/flutter/widgets/Align-class.html), which lets you arbitrarily position a child within itself, rather than just centering it.
- [Row](https://api.flutter.dev/flutter/widgets/Row-class.html), a widget that displays its children in a horizontal array.
- [Column](https://api.flutter.dev/flutter/widgets/Column-class.html), a widget that displays its children in a vertical array.
- [Container](https://api.flutter.dev/flutter/widgets/Container-class.html), a convenience widget that combines common painting, positioning, and sizing widgets.
- The catalog of [layout widgets](https://flutter.dev/widgets/layout/).
''';

TagRenderer centerRenderer() {
  return TagRenderer(
    icon: IconPack.flu_center_vertical_regular,
    tag: 'center',
    pattern: RegExp(r'<center.*>'),
    endPattern: RegExp('</center>'),
    description: const TagDescription(
      description: description,
      arguments: [
        TagArgument('heightFactor', {'double', 'null'}),
        TagArgument('widthFactor', {'double', 'null'}),
      ],
      properties: [],
    ),
    example: '''
<text size="24">
  Center
</text>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final CenterArguments arguments = CenterArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Center(
        heightFactor: arguments.heightFactor,
        widthFactor: arguments.widthFactor,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
