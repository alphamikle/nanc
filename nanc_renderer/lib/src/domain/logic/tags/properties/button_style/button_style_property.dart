import 'package:flutter/material.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'button_style_arguments.dart';
import 'button_style_property_widget.dart';

PropertyTagRenderer<ButtonStyle> buttonStyleProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final ButtonStyleArguments arguments = ButtonStyleArguments.fromJson(element.attributes);

      return ButtonStylePropertyWidget(
        name: tag,
        property: ButtonStyle(
          backgroundColor: arguments.backgroundColor == null ? null : MaterialStatePropertyAll(arguments.backgroundColor),
          alignment: arguments.align?.toAlignment(),
          elevation: arguments.elevation == null ? null : MaterialStatePropertyAll(arguments.elevation),
          foregroundColor: arguments.foregroundColor == null ? null : MaterialStatePropertyAll(arguments.foregroundColor),
          iconColor: arguments.iconColor == null ? null : MaterialStatePropertyAll(arguments.iconColor),
          iconSize: arguments.iconSize == null ? null : MaterialStatePropertyAll(arguments.iconSize),
          overlayColor: arguments.overlayColor == null ? null : MaterialStatePropertyAll(arguments.overlayColor),
          shadowColor: arguments.shadowColor == null ? null : MaterialStatePropertyAll(arguments.shadowColor),
          surfaceTintColor: arguments.surfaceTintColor == null ? null : MaterialStatePropertyAll(arguments.surfaceTintColor),
        ),
      );
    },
  );
}
