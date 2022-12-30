import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/material/material_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer materialRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_material_design,
    tag: 'material',
    pattern: RegExp(r'<material.*>'),
    endPattern: RegExp('</material>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final MaterialArguments arguments = MaterialArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      final BorderRadius? radius = extractor.getProperty<BorderRadius>(borderRadius);

      return Material(
        type: arguments.type ?? MaterialType.canvas,
        color: arguments.color,
        borderRadius: radius,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
