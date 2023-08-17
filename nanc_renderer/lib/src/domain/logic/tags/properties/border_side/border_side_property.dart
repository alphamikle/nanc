import 'package:flutter/material.dart';

import '../../../model/tag.dart';
import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'border_side_arguments.dart';
import 'border_side_property_widget.dart';

PropertyTagRenderer<BorderSide> borderSideProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final BorderSideArguments arguments = BorderSideArguments.fromJson(element.attributes);

      return BorderSidePropertyWidget(
        name: tag,
        property: BorderSide(
          color: arguments.color ?? Colors.black,
          style: arguments.style ?? BorderStyle.solid,
          width: arguments.width ?? 1,
          strokeAlign: arguments.align?.toStrokeAlign() ?? BorderSide.strokeAlignInside,
        ),
      );
    },
  );
}
