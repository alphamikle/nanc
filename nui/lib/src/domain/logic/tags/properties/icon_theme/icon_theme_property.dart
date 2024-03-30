import 'package:flutter/material.dart';

import '../../../../../../nui.dart';
import '../../tools/properties_names.dart';
import 'icon_theme_arguments.dart';
import 'icon_theme_property_widget.dart';

PropertyTagRenderer<IconThemeData> iconThemeProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final IconThemeArguments arguments = IconThemeArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: renderer.renderChildren(context, element.children));

      return IconThemePropertyWidget(
        name: tag,
        property: IconThemeData(
          size: arguments.size,
          color: arguments.color,
          fill: arguments.fill,
          grade: arguments.grade,
          opacity: arguments.opacity,
          opticalSize: arguments.opticalSize,
          shadows: extractor.getProperties(shadow),
          weight: arguments.weight,
        ),
      );
    },
  );
}
