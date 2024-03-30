import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'box_constraints_arguments.dart';
import 'box_constraints_property_widget.dart';

PropertyTagRenderer<BoxConstraints> boxConstraintsProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final BoxConstraintsArguments arguments = BoxConstraintsArguments.fromJson(element.attributes);

      return BoxConstraintsPropertyWidget(
        name: tag,
        property: BoxConstraints(
          maxHeight: arguments.maxHeight ?? double.infinity,
          maxWidth: arguments.maxWidth ?? double.infinity,
          minWidth: arguments.minWidth ?? 0,
          minHeight: arguments.minHeight ?? 0,
        ),
      );
    },
  );
}
