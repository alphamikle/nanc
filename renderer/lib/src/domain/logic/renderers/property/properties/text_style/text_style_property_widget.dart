import 'package:flutter/material.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

class TextStylePropertyWidget extends PropertyWidget<TextStyle> {
  const TextStylePropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
