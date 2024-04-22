import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';

PropertyTagRenderer<ShapeBorder> shapeBorderProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      return null;
      // TODO(alphamikle): Continue work, if just border will be not enough
      // final ShapeBorderArguments arguments = ShapeBorderArguments.fromJson(element.attributes);
      // return ShapeBorderWidget(
      //   name: tag,
      //   property: ShapeBorder(
      //       //
      //       ),
      // );
    },
  );
}
