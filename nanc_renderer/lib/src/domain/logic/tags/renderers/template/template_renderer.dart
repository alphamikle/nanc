import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;

import '../../documentation/documentation.dart';
import '../../logic/local_data.dart';
import '../../logic/template_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'template_arguments.dart';

const String kTemplate = 'template';
final RegExp _templateRegExp = RegExp(r'template\.(?<valueId>\w+)');

TagRenderer templateRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_content_copy,
    tagType: TagType.other,
    tag: 'template',
    description: TagDescription(
      description: '''
# Template

Template is another custom widget, the blood brother of the `component`. Template allows you to describe a complex widget and then easily reuse it in your UI. It can be compared to a custom Flutter widget written by your own hands.

At the moment there is support only for parameters passing, but in the near future it will be possible to transfer other components, getting the most flexibility.
''',
      arguments: [
        idArg(),
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final TemplateArguments arguments = TemplateArguments.fromJson(element.attributes);

      if (arguments.id == null || arguments.id!.isEmpty) {
        return null;
      }
      final TemplateId templateId = arguments.id!;

      // ignore: use_build_context_synchronously
      final TemplateStorage templateStorage = TemplateStorage.of(context);
      final List<md.Node> preparedComponents = _prepareTemplateContent(templateId, element.children ?? []);

      templateStorage.saveTemplate(
        templateId: templateId,
        components: preparedComponents,
      );

      return null;
    },
  );
}

List<md.Node> _prepareTemplateContent(TemplateId templateId, List<md.Node> components) {
  final List<md.Node> preparedComponents = [];
  for (final md.Node node in components) {
    preparedComponents.add(_prepareTemplateChild(templateId, node));
  }
  return preparedComponents;
}

md.Node _prepareTemplateChild(TemplateId templateId, md.Node child) {
  if (child is md.Element) {
    final md.Element newElement = md.Element(child.tag, _prepareTemplateContent(templateId, child.children ?? []));
    for (final MapEntry<String, String> attributeEntry in child.attributes.entries) {
      newElement.attributes[attributeEntry.key] = _replaceSimpleTemplateExpressionWithComplex(templateId, attributeEntry.value);
    }
    return newElement;
  } else if (child is md.Text) {
    return md.Text(_replaceSimpleTemplateExpressionWithComplex(templateId, child.textContent));
  } else if (child is md.UnparsedContent) {
    return md.UnparsedContent(_replaceSimpleTemplateExpressionWithComplex(templateId, child.textContent));
  }
  throw Exception('Unknown Node: ${child.runtimeType}');
}

String _replaceSimpleTemplateExpressionWithComplex(TemplateId templateId, String value) {
  final Iterable<RegExpMatch> matches = _templateRegExp.allMatches(value);
  if (matches.isEmpty) {
    return value;
  }
  String enrichmentValue = value;
  for (final RegExpMatch match in matches) {
    final String valueId = match.namedGroup(kValueId)!;
    enrichmentValue = enrichmentValue.replaceFirst('$kTemplate.$valueId', '$kTemplate($templateId).$valueId');
  }
  return enrichmentValue;
}
