import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';

class ColorPropertyWidget extends PropertyWidget<Color> {
  const ColorPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
