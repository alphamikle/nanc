import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'input_border_arguments.dart';
import 'input_border_property_widget.dart';

PropertyTagRenderer<InputBorder> inputBorderProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final InputBorderArguments arguments = InputBorderArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: renderer.renderChildren(context, element.children));

      final InputBorderType type = arguments.type ?? InputBorderType.none;

      final InputBorder border = switch (type) {
        InputBorderType.outline => OutlineInputBorder(
            borderRadius: extractor.getProperty(borderRadius) ?? BorderRadius.circular(4),
            borderSide: extractor.getProperty(borderSide) ?? const BorderSide(),
            gapPadding: arguments.gap ?? 4,
          ),
        InputBorderType.underline => UnderlineInputBorder(
            borderRadius: extractor.getProperty(borderRadius) ??
                const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
            borderSide: extractor.getProperty(borderSide) ?? const BorderSide(),
          ),
        InputBorderType.none => InputBorder.none,
      };

      return InputBorderPropertyWidget(
        name: tag,
        property: border,
      );
    },
  );
}
