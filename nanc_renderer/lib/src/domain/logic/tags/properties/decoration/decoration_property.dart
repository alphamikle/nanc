import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'decoration_arguments.dart';
import 'decoration_property_widget.dart';

PropertyTagRenderer<Decoration> decorationProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final DecorationArguments arguments = DecorationArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: renderer.renderChildren(context, element.children));

      return DecorationPropertyWidget(
        name: tag,
        property: BoxDecoration(
          borderRadius: extractor.getProperty(borderRadius),
          color: arguments.color,
          border: extractor.getProperty(border),
          boxShadow: extractor.getProperties(shadow),
          gradient: extractor.getProperty(gradient),
          backgroundBlendMode: arguments.blendMode,
        ),
      );
    },
  );
}
