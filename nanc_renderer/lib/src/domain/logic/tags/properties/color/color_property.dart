import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'color_arguments.dart';
import 'color_property_widget.dart';

PropertyTagRenderer<Color> colorProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final ColorArguments arguments = ColorArguments.fromJson(element.attributes);

      return ColorPropertyWidget(
        name: tag,
        property: arguments.color,
      );
    },
  );
}
