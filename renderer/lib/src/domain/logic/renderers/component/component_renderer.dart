import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/common.dart';
import 'package:rich_renderer/src/renderers/component/component_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/tools/enrich_nodes.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

const String kHashAttribute = r'_$componentDataHash';

const String _description = '''
# Component

`component` - is the sibling of the `template` widget and they are inextricably linked with each other. `component` can consume any kind of arguments to itself. There only one required argument in the `component` - the `id`, which should be the same as the corresponding linked template. In the future templates (and the components) will be able to pass to themself not only values, but another widgets too.

Also, component gives you a possibility to substitute values from the template. For details see the demo code.
''';

TagRenderer componentRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_widgets_outline,
    tag: 'component',
    // TODO(alphamikle): Components should be of both types - single line and multiline tags
    pattern: RegExp(r'<component.*/>'),
    endPattern: null,
    description: TagDescription(
      description: _description,
      arguments: [
        idArg(),
        anyArg(),
      ],
      properties: [],
    ),
    example: '''
<template id="exampleCard">
  <container width="{{ template.size }}" height="{{ template.size }}" color="{{ template.color }}">
  </container>
</template>

<container width="300" height="600" color="#457FDA">
  <column>
    <component id="exampleCard" size="100" color="#7BDA45"/>
    <component id="exampleCard" size="150" color="#A5DA9745"/>
    <component id="exampleCard" size="100" color="#7BDA45"/>
  </column>
</container>
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
      final String hash = element.attributes.toString();
      final List<md.Node>? richComponentContent = await enrichNodesWithAttribute(attributeName: kHashAttribute, attributeValue: hash, nodes: templateContent);
      templateStorage.saveArguments(
        templateId: templateId,
        hash: hash,
        arguments: element.attributes,
      );
      final PropertiesExtractor extractor = PropertiesExtractor(
        context: context,
        // ignore: use_build_context_synchronously
        rawChildren: await richRenderer.renderChildren(context, richComponentContent),
      );
      return compactWidgets(extractor.children);
    },
  );
}
