import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'border_radius_arguments.dart';
import 'border_radius_property_widget.dart';

PropertyTagRenderer<BorderRadiusGeometry> borderRadiusProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final BorderRadiusArguments arguments = BorderRadiusArguments.fromJson(element.attributes);

      return BorderRadiusPropertyWidget(
        name: tag,
        property: arguments.toBorderRadius(),
      );
    },
  );
}
