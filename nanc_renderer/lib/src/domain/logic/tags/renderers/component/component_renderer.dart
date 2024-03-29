import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../logic/template_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/enrich_nodes.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import '../alias/alias_renderer.dart';
import '../slot/slot_renderer.dart';
import 'component_arguments.dart';

const String kHashAttribute = r'_$componentDataHash';

const String _description = '''
# Component

`component` - is the sibling of the `template` widget and they are inextricably linked with each other.
`component` can consume any kind of arguments to itself.
There only one required argument in the `component` - the `id`, which should be the same as the corresponding linked template.
Component gives you a possibility to substitute values from the template. 

> Also, you can use `slot` and `alias` - special tags designed to pass other widgets/tags as arguments, inside templates.

`<alias>` is the only tag that makes sense to specify as a direct descendant of the `<component>` tag - any other tags specified directly inside `<component>` will be ignored.
However, you can use any tags inside `<alias>` without any problem.

For details see the demo code.
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
    <slot name="child"/>
  </container>
</template>

<container width="300" height="600" color="#457FDA">
  <column>
    <component id="exampleCard" size="100" color="#7BDA45">
      <alias name="child">
        <center>
          <text text="I'm a child"/>
        </center>
      </alias>
    </component>
    <component id="exampleCard" size="150" color="#A5DA9745">
      <alias name="child">
        <center>
          <component id="exampleCard" size="100" color="brown">
            <alias name="child">
              <center>
                <text text="I'm a child"/>
              </center>
            </alias>
          </component>
        </center>
      </alias>
    </component>
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
      final List<TagNode> templateContentWithReplacedSlots = _replaceSlots(templateContent, element.children);
      final String hash = element.attributes.toString();
      final List<TagNode>? richComponentContent = enrichNodesWithAttribute(
        attributeName: kHashAttribute,
        attributeValue: hash,
        nodes: templateContentWithReplacedSlots,
      );
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

List<TagNode> _replaceSlots(List<TagNode> templateNodes, List<TagNode> componentNodes) {
  final Map<String, List<TagNode>> aliases = _searchAliases(componentNodes);
  final List<TagNode> result = [];
  for (final TagNode node in templateNodes) {
    result.addAll(_replaceSlotsInNode(node, aliases));
  }
  return result;
}

List<TagNode> _replaceSlotsInNode(TagNode node, Map<String, List<TagNode>> aliases) {
  if (node is WidgetTag) {
    final String? slotName = node.attributes[kSlotName];

    if (node.tag == kSlotTag && slotName != null && aliases.containsKey(slotName)) {
      return aliases[slotName]!;
    }

    final List<TagNode> children = [];

    for (final TagNode child in node.children) {
      children.addAll(_replaceSlotsInNode(child, aliases));
    }

    return [node.copyWith(children: children)];
  } else if (node is PropertyTag) {
    final List<TagNode> children = [];

    for (final TagNode child in node.children) {
      children.addAll(_replaceSlotsInNode(child, aliases));
    }

    return [node.copyWith(children: children)];
  }
  return [node];
}

Map<String, List<TagNode>> _searchAliases(List<TagNode> componentNodes) {
  final Map<String, List<TagNode>> result = {};
  for (final TagNode node in componentNodes) {
    if (node is WidgetTag && node.tag == kAliasTag) {
      final String? aliasName = node.attributes[kAliasName];
      if (aliasName?.isNotEmpty ?? false) {
        result[aliasName!] = node.children;
      }
    }
  }
  return result;
}
