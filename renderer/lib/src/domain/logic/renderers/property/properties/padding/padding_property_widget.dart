import 'package:flutter/material.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

class PaddingPropertyWidget extends PropertyWidget<EdgeInsets> {
  const PaddingPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
