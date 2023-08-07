import 'package:flutter/material.dart';

import '../../../../../../nanc_renderer.dart';
import 'shape_border_arguments.dart';

PropertyTagRenderer<ShapeBorder> shapeBorderProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final ShapeBorderArguments arguments = ShapeBorderArguments.fromJson(element.attributes);

      return null;
      // TODO(alphamikle): Continue work, if just border will be not enough
      // return ShapeBorderWidget(
      //   name: tag,
      //   property: ShapeBorder(
      //       //
      //       ),
      // );
    },
  );
}
