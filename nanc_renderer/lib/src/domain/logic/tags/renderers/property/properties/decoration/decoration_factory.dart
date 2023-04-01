import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/decoration/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/decoration/decoration_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';

DecorationPropertyWidget decorationFactory({
  required BuildContext context,
  required String name,
  required md.Element element,
  required RichRenderer richRenderer,
}) {
  final DecorationArguments arguments = DecorationArguments.fromJson(element.attributes);
  final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

  final BoxDecoration decoration = BoxDecoration(
    borderRadius: extractor.getProperty(borderRadius),
    color: arguments.color,
    border: extractor.getProperty(border),
    boxShadow: extractor.getProperties(shadow),
    gradient: extractor.getProperty(gradient),
    backgroundBlendMode: arguments.blendMode,
  );

  return DecorationPropertyWidget(name: name, property: decoration);
}
