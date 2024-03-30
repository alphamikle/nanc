import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'strut_style_arguments.dart';
import 'strut_style_property_widget.dart';

PropertyTagRenderer<StrutStyle> strutStyleProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final StrutStyleArguments arguments = StrutStyleArguments.fromJson(element.attributes);

      return StrutStylePropertyWidget(
        name: tag,
        property: StrutStyle(
          height: arguments.height,
          leading: arguments.leading,
          fontSize: arguments.size,
          debugLabel: arguments.debugLabel,
          fontFamily: arguments.font,
          fontWeight: arguments.weight?.toFontWeight(),
          forceStrutHeight: arguments.forceHeight,
          fontStyle: arguments.fontStyle,
          package: arguments.package,
        ),
      );
    },
  );
}
