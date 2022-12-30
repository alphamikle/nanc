import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/component/component_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String kHashAttribute = r'_$componentDataHash';

TagRenderer componentRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_widgets_outline,
    tag: 'component',
    // TODO(alphamikle): Components should be of both types - single line and multiline tags
    pattern: RegExp(r'<component.*/>'),
    endPattern: null,
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final TemplateStorage templateStorage = TemplateStorage.of(context);
      final ComponentArguments arguments = ComponentArguments.fromJson(element.attributes);

      if (arguments.id == null || arguments.id!.isEmpty) {
        return null;
      }

      final TemplateId templateId = arguments.id!;

      final List<md.Node> templateContent = templateStorage.findTemplate(templateId) ?? [];
      if (templateContent.isEmpty) {
        return null;
      }
      final List<md.Node> richComponentContent = [];
      final String hash = element.attributes.toString();
      await _enrichContentChildrenWithHash(hash, templateContent, richComponentContent);
      templateStorage.saveArguments(
        templateId: templateId,
        hash: hash,
        arguments: element.attributes,
      );
      // ignore: use_build_context_synchronously
      final PropertiesExtractor extractor =
          PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, richComponentContent));
      return compactWidgets(extractor.children);
    },
  );
}

Future<void> _enrichContentChildrenWithHash(String hash, List<md.Node> children, List<md.Node> output) async {
  for (final md.Node child in children) {
    if (child is md.Element) {
      final List<md.Node> newChildren = [];
      await _enrichContentChildrenWithHash(hash, child.children ?? [], newChildren);
      final md.Element newChild = md.Element(child.tag, newChildren);
      newChild.attributes.addAll(child.attributes);
      newChild.attributes[kHashAttribute] = hash;
      output.add(newChild);
    } else {
      output.add(child);
    }
  }
}
