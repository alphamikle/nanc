import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';

class BorderPropertyWidget extends PropertyWidget<BoxBorder> {
  const BorderPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
