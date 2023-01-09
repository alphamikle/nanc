import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/border_radius_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/position_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/scale/scale_arguments.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

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
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ScaleArguments arguments = ScaleArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Transform.scale(
        scaleX: arguments.all ?? arguments.scaleX,
        scaleY: arguments.all ?? arguments.scaleY,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
