import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../logic/template_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../component/component_renderer.dart';
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

Template is another custom widget, the blood brother of the `component`.
Template allows you to describe a complex widget and then easily reuse it in your UI.
It can be compared to a custom Flutter widget written by your own hands.

> Also, you can use `slot` and `alias` - special tags designed to pass other widgets/tags as arguments, inside templates.

For more clarity, take a look at the examples.
''',
      arguments: [
        idArgument(),
      ],
      properties: [],
    ),
    example: componentRenderer().example,
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TemplateArguments arguments = TemplateArguments.fromJson(element.attributes);

      if (arguments.id == null || arguments.id!.isEmpty) {
        return null;
      }
      final TemplateId templateId = arguments.id!;

      final TemplateStorage templateStorage = TemplateStorage.of(context);
      final List<TagNode> preparedComponents = _prepareTemplateContent(templateId, element.children);

      templateStorage.saveTemplate(
        templateId: templateId,
        components: preparedComponents,
      );

      return null;
    },
  );
}

List<TagNode> _prepareTemplateContent(TemplateId templateId, List<TagNode> components) {
  final List<TagNode> preparedComponents = [];
  for (final TagNode node in components) {
    preparedComponents.add(_prepareTemplateChild(templateId, node));
  }
  return preparedComponents;
}

TagNode _prepareTemplateChild(TemplateId templateId, TagNode child) {
  if (child is WidgetTag) {
    final Map<String, String> attributes = {};
    for (final MapEntry<String, String> attributeEntry in child.attributes.entries) {
      attributes[attributeEntry.key] = _replaceSimpleTemplateExpressionWithComplex(templateId, attributeEntry.value);
    }
    return child.copyWith(
      children: _prepareTemplateContent(templateId, child.children),
      attributes: attributes,
    );
  } else if (child is TextNode) {
    return child.copyWith(
      text: _replaceSimpleTemplateExpressionWithComplex(templateId, child.text),
    );
  } else if (child is UnknownNode) {
    // TODO(alphamikle): Need to test that case, if we will do nothing
    return child.copyWith(
      text: _replaceSimpleTemplateExpressionWithComplex(templateId, child.text),
    );
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
