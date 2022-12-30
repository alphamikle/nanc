import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/positioned/positioned_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer positionedRenderer() {
  return TagRenderer(
    icon: IconPack.flu_position_to_front_regular,
    tag: 'positioned',
    pattern: RegExp(r'<positioned.*>'),
    endPattern: RegExp('</positioned>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final PositionedArguments arguments = PositionedArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final double? all = arguments.all;

      return Positioned(
        width: arguments.width,
        height: arguments.height,
        left: all ?? arguments.left,
        top: all ?? arguments.top,
        right: all ?? arguments.right,
        bottom: all ?? arguments.bottom,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
