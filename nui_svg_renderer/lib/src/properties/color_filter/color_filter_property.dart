import 'package:flutter/material.dart';
import 'package:nui/nui.dart';

import 'color_filter_arguments.dart';
import 'color_filter_property_widget.dart';

const String colorFilter = 'colorFilter';

PropertyTagRenderer<ColorFilter> colorFilterProperty({String name = colorFilter}) {
  return PropertyTagRenderer(
    tag: name,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final ColorFilterArguments arguments = ColorFilterArguments.fromJson(element.attributes);

      if (arguments.color == null || arguments.mode == null) {
        return null;
      }

      return ColorFilterPropertyWidget(
        name: name,
        property: ColorFilter.mode(arguments.color!, arguments.mode!),
      );
    },
  );
}
