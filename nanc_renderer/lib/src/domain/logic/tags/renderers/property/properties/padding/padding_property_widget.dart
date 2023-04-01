import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';

class PaddingPropertyWidget extends PropertyWidget<EdgeInsets> {
  const PaddingPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
