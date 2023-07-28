import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../logic/template_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/enrich_nodes.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'component_arguments.dart';

const String kHashAttribute = r'_$componentDataHash';

const String _description = '''
# Component

`component` - is the sibling of the `template` widget and they are inextricably linked with each other. `component` can consume any kind of arguments to itself. There only one required argument in the `component` - the `id`, which should be the same as the corresponding linked template. In the future templates (and the components) will be able to pass to themself not only values, but another widgets too.

Also, component gives you a possibility to substitute values from the template. For details see the demo code.
''';

TagRenderer componentRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_widgets_outline,
    tagType: TagType.other,
    tag: 'component',
    // TODO(alphamikle): Components should be of both types - single line and multiline tags

    description: TagDescription(
      description: _description,
      arguments: [
        idArgument(),
        anyArgument(),
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
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TemplateStorage templateStorage = TemplateStorage.of(context);
      final ComponentArguments arguments = ComponentArguments.fromJson(element.attributes);

      if (arguments.id == null || arguments.id!.isEmpty) {
        return null;
      }

      final TemplateId templateId = arguments.id!;

      final List<TagNode> templateContent = templateStorage.findTemplate(templateId) ?? [];
      if (templateContent.isEmpty) {
        return null;
      }
      final String hash = element.attributes.toString();
      final List<TagNode>? richComponentContent = enrichNodesWithAttribute(attributeName: kHashAttribute, attributeValue: hash, nodes: templateContent);
      templateStorage.saveArguments(
        templateId: templateId,
        hash: hash,
        arguments: element.attributes,
      );
      final PropertiesExtractor extractor = PropertiesExtractor(
        context: context,
        rawChildren: richRenderer.renderChildren(context, richComponentContent),
      );
      return compactWidgets(extractor.children);
    },
  );
}
