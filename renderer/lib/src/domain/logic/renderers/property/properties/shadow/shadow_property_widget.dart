import 'package:flutter/cupertino.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';

class ShadowPropertyWidget extends PropertyWidget<BoxShadow> {
  const ShadowPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
