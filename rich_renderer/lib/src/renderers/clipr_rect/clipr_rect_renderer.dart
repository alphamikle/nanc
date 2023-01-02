import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/clipr_rect/clipr_rect_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String description = '''
A widget that clips its child using a rounded rectangle.

By default, [ClipRRect](widgets/ClipRRect-class.html) uses its own bounds as the base rectangle for the clip, but the size and location of the clip can be customized using a custom [clipper](widgets/ClipRRect/clipper.html).

This example shows various [ClipRRect](widgets/ClipRRect-class.html)s applied to containers.

[_link_](# "Copy link to clipboard")

To create a local project with this code sample, run:  
flutter create --sample=widgets.ClipRRect.1 mysample

Troubleshooting
---------------

### Why doesn't my [ClipRRect](widgets/ClipRRect-class.html) child have rounded corners?

When a [ClipRRect](widgets/ClipRRect-class.html) is bigger than the child it contains, its rounded corners could be drawn in unexpected positions. Make sure that [ClipRRect](widgets/ClipRRect-class.html) and its child have the same bounds (by shrinking the [ClipRRect](widgets/ClipRRect-class.html) with a [FittedBox](widgets/FittedBox-class.html) or by growing the child).

This example shows a [ClipRRect](widgets/ClipRRect-class.html) that adds round corners to an image.

[_link_](# "Copy link to clipboard")

To create a local project with this code sample, run:  
flutter create --sample=widgets.ClipRRect.2 mysample

See also:

*   [CustomClipper](rendering/CustomClipper-class.html), for information about creating custom clips.
*   [ClipRect](widgets/ClipRect-class.html), for more efficient clips without rounded corners.
*   [ClipOval](widgets/ClipOval-class.html), for an elliptical clip.
*   [ClipPath](widgets/ClipPath-class.html), for an arbitrarily shaped clip.
''';

TagRenderer clipRRectRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_scissors_cutting,
    tag: 'clipRRect',
    pattern: RegExp(r'<clipRRect.*>'),
    endPattern: RegExp('</clipRRect>'),
    description: const TagDescription(
      description: description,
      arguments: [
        TagArgument('topLeft', {'double', 'null'}),
        TagArgument('topRight', {'double', 'null'}),
        TagArgument('bottomRight', {'double', 'null'}),
        TagArgument('bottomRight', {'double', 'null'}),
        TagArgument('bottomLeft', {'double', 'null'}),
        TagArgument('all', {'double', 'null'}),
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ClipRRectArguments arguments = ClipRRectArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return ClipRRect(
        borderRadius: arguments.toBorderRadius(),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
