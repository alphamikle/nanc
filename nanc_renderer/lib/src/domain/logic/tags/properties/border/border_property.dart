import 'package:flutter/material.dart';

import '../../../model/tag.dart';
import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'border_arguments.dart';
import 'border_property_widget.dart';

PropertyTagRenderer<BoxBorder> borderProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final BorderArguments arguments = BorderArguments.fromJson(element.attributes);

      return BorderPropertyWidget(
        name: tag,
        property: arguments.toBorder(context),
      );
    },
  );
}
