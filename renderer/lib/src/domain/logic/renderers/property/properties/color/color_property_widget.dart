import 'package:flutter/material.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

class ColorPropertyWidget extends PropertyWidget<Color> {
  const ColorPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
