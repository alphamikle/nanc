import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'double_arguments.dart';
import 'double_property_widget.dart';

PropertyTagRenderer<double> doubleProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final DoubleArguments arguments = DoubleArguments.fromJson(element.attributes);

      return DoublePropertyWidget(
        name: tag,
        property: arguments.value,
      );
    },
  );
}
