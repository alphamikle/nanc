import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/scale/scale_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/widgets_compactor.dart';

TagRenderer scaleRenderer() {
  return TagRenderer(
    icon: IconPack.flu_scale_fill_filled,
    tag: 'scale',
    pattern: RegExp(r'<scale.*>'),
    endPattern: RegExp('</scale>'),
    description: TagDescription(
      description: '''
# [Transform.scale](https://api.flutter.dev/flutter/widgets/Transform-class.html)

A widget that applies a transformation before painting its child.

Unlike [RotatedBox](widgets/RotatedBox-class.html), which applies a rotation prior to layout, this object applies its transformation just prior to painting, which means the transformation is not taken into account when calculating how much space this widget's child (and thus this widget) consumes.
''',
      arguments: [
        scaleXArg(),
        scaleYArg(),
        allArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <center>
    <scale scaleY="0.5">
      <container width="100" height="100" color="#457FDA">
        <prop:decoration>
          <prop:borderRadius all="100"/>
        </prop:decoration>
      </container>
    </scale>
  </center>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final ScaleArguments arguments = ScaleArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Transform.scale(
        scaleX: arguments.all ?? arguments.scaleX,
        scaleY: arguments.all ?? arguments.scaleY,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
