import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/sized_box/sized_box_arguments.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer sizedBoxRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_move_resize,
    tag: 'sizedBox',
    pattern: RegExp(r'<sizedBox.*>'),
    endPattern: RegExp('</sizedBox>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final SizedBoxArguments arguments = SizedBoxArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final double? all = arguments.all;

      return SizedBox(
        height: all ?? arguments.height,
        width: all ?? arguments.width,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
