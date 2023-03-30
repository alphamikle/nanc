import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/property/properties/gradient/gradient_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/gradient/gradient_property_widget.dart';
import 'package:rich_renderer/src/rich_renderer.dart';

GradientPropertyWidget gradientFactory({
  required BuildContext context,
  required String name,
  required md.Element element,
  required RichRenderer richRenderer,
}) {
  final GradientArguments arguments = GradientArguments.fromJson(element.attributes);
  final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

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

  return GradientPropertyWidget(name: name, property: gradient);
}
