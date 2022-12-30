import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/template/template_arguments.dart';
import 'package:tools/tools.dart';

const String kTemplate = 'template';
final RegExp _templateRegExp = RegExp(r'template\.(?<valueId>\w+)');

TagRenderer templateRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_content_copy,
    tag: 'template',
    pattern: RegExp(r'<template.*>'),
    endPattern: RegExp('</template>'),
    example: '''
TODO
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final TemplateArguments arguments = TemplateArguments.fromJson(element.attributes);

      if (arguments.id == null || arguments.id!.isEmpty) {
        return null;
      }
      final TemplateId templateId = arguments.id!;

      // ignore: use_build_context_synchronously
      final TemplateStorage templateStorage = TemplateStorage.of(context);
      final List<md.Node> preparedComponents = await _prepareTemplateContent(templateId, element.children ?? []);

      templateStorage.saveTemplate(
        templateId: templateId,
        components: preparedComponents,
      );

      return null;
    },
  );
}

Future<List<md.Node>> _prepareTemplateContent(TemplateId templateId, List<md.Node> components) async {
  final List<md.Node> preparedComponents = [];
  for (final md.Node node in components) {
    preparedComponents.add(await _prepareTemplateChild(templateId, node));
  }
  return preparedComponents;
}

Future<md.Node> _prepareTemplateChild(TemplateId templateId, md.Node child) async {
  await wait();
  if (child is md.Element) {
    final md.Element newElement = md.Element(child.tag, await _prepareTemplateContent(templateId, child.children ?? []));
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
