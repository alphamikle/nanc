import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'center_arguments.dart';

const String _description = '''
# [Center](https://api.flutter.dev/flutter/widgets/Center-class.html)

A widget that centers its child within itself.

This widget will be as big as possible if its dimensions are constrained and [widthFactor](widgets/Align/widthFactor.html) and [heightFactor](widgets/Align/heightFactor.html) are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.
''';

TagRenderer centerRenderer() {
  return TagRenderer(
    icon: IconPack.flu_center_vertical_regular,
    tagType: TagType.widget,
    tag: 'center',
    description: TagDescription(
      description: _description,
      arguments: [
        doubleArgument(name: 'heightFactor'),
        doubleArgument(name: 'widthFactor'),
      ],
      properties: [],
    ),
    example: '''
<container width="300" height="300" color="#457FDA">
  <center widthFactor="1" heightFactor="1">
    <container width="100" height="100" color="#7BDA45">
    </container>
  </center>
</container>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final CenterArguments arguments = CenterArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Center(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        heightFactor: arguments.heightFactor,
        widthFactor: arguments.widthFactor,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
