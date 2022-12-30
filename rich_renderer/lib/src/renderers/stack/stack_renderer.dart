import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/stack/stack_arguments.dart';
import 'package:rich_renderer/src/rich_renderer.dart';
import 'package:rich_renderer/src/tag_renderer.dart';

TagRenderer stackRenderer() {
  return TagRenderer(
    icon: IconPack.flu_stack_regular,
    tag: 'stack',
    pattern: RegExp(r'<stack.*>'),
    endPattern: RegExp('</stack>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final StackArguments arguments = StackArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return Stack(
        fit: arguments.fit ?? StackFit.loose,
        alignment: arguments.toAlignment() ?? Alignment.topLeft,
        children: extractor.children,
      );
    },
  );
}
