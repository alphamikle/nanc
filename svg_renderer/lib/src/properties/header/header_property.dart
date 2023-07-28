import 'package:flutter/material.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import 'header_arguments.dart';
import 'headers_property_widget.dart';

typedef Header = MapEntry<String, String>;

const String header = 'header';

PropertyTagRenderer<Header> headerProperty({String name = header}) {
  return PropertyTagRenderer(
    tag: name,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final HeaderArguments headerArguments = HeaderArguments.fromJson(element.attributes);

      if (headerArguments.isEmpty) {
        return null;
      }

      return HeadersPropertyWidget(
        name: name,
        property: MapEntry(headerArguments.name!, headerArguments.value!),
      );
    },
  );
}
