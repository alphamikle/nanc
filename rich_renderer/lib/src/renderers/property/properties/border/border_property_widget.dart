import 'package:flutter/material.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

class BorderPropertyWidget extends PropertyWidget<BoxBorder> {
  const BorderPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
