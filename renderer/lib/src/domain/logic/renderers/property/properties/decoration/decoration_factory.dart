import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/property/properties/decoration/decoration_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/decoration/decoration_property_widget.dart';

Future<DecorationPropertyWidget> decorationFactory({
  required BuildContext context,
  required String name,
  required md.Element element,
  required RichRenderer richRenderer,
}) async {
  final DecorationArguments arguments = DecorationArguments.fromJson(element.attributes);
  final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

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
