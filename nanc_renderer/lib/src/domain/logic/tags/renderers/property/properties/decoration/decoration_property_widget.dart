import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';

class DecorationPropertyWidget extends PropertyWidget<Decoration> {
  const DecorationPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
