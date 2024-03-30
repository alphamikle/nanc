import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'clipr_rect_arguments.dart';

const String _description = '''
# [Clipr Rect](https://api.flutter.dev/flutter/widgets/ClipRRect-class.html)

A widget that clips its child using a rounded rectangle.

By default, [ClipRRect](widgets/ClipRRect-class.html) uses its own bounds as the base rectangle for the clip, but the size and location of the clip can be customized using a custom [clipper](widgets/ClipRRect/clipper.html).
''';

TagRenderer clipRRectRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_scissors_cutting,
    tagType: TagType.widget,
    tag: 'clipRRect',
    description: TagDescription(
      description: _description,
      arguments: [
        topLeftArgument(),
        topRightArgument(),
        bottomRightArgument(),
        bottomLeftArgument(),
        allArgument(),
      ],
      properties: [],
    ),
    example: '''
<container width="300" height="300" color="#457FDA">
  <center>
    <clipRRect topLeft="64" bottomRight="64">
      <container width="100" height="100" color="#7BDA45">
      </container>
    </clipRRect>
  </center>
</container>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ClipRRectArguments arguments = ClipRRectArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return ClipRRect(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        borderRadius: arguments.toBorderRadius(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
