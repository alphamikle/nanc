import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'gradient_arguments.dart';
import 'gradient_property_widget.dart';

PropertyTagRenderer<Gradient> gradientProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final GradientArguments arguments = GradientArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: renderer.renderChildren(context, element.children));

      final Alignment beginValue = extractor.getProperty(begin) ?? Alignment.centerLeft;
      final Alignment endValue = extractor.getProperty(end) ?? Alignment.centerRight;
      final List<Color> colors = extractor.getProperties(color);
      final List<double> stops = extractor.getProperties(stop);

      if (stops.isEmpty) {
        for (int i = 0; i < colors.length; i++) {
          stops.add(1 / colors.length * (i + 1));
        }
      } else if (stops.length < colors.length) {
        for (int i = 0; i < colors.length; i++) {
          final bool hasCurrentStop = (stops.length - 1) == i;
          if (!hasCurrentStop) {
            stops.add(1 / colors.length * (i + 1));
          }
        }
      } else if (stops.length > colors.length) {
        stops.removeRange(colors.length - 1, stops.length);
      }

      final Gradient gradient = LinearGradient(
        tileMode: arguments.tileMode ?? TileMode.clamp,
        colors: colors,
        stops: stops,
        begin: beginValue,
        end: endValue,
      );

      return GradientPropertyWidget(name: tag, property: gradient);
    },
  );
}
