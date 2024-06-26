import 'package:flutter/material.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'text_style_arguments.dart';
import 'text_style_property_widget.dart';

PropertyTagRenderer<TextStyle> textStyleProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final TextStyleArguments arguments = TextStyleArguments.fromJson(element.attributes);
      late TextStyle effectiveStyle;
      if (arguments.font != null && arguments.font!.trim().isNotEmpty) {
        try {
          if (FontsStorage.isCustomFontExist(arguments.font!)) {
            final CustomFont customFont = FontsStorage.getCustomFontByName(arguments.font!);
            effectiveStyle = TextStyle(fontFamily: customFont.font, package: customFont.package);
          } else if (FontsStorage.isGoogleFontExist(arguments.font!)) {
            effectiveStyle = GoogleFonts.getFont(arguments.font!);
          } else {
            effectiveStyle = const TextStyle();
          }
        } catch (error, stackTrace) {
          logWarning('Error on loading font with name "${arguments.font}"', error: error, stackTrace: stackTrace);
          effectiveStyle = const TextStyle();
        }
      } else {
        effectiveStyle = const TextStyle();
      }
      effectiveStyle = effectiveStyle.copyWith(
        color: arguments.color,
        fontSize: arguments.size,
        height: arguments.height,
        fontWeight: arguments.weight?.toFontWeight(),
        decoration: arguments.decoration?.toTextDecoration(),
        overflow: arguments.overflow,
        textBaseline: arguments.baseline,
        fontFamily: arguments.font,
      );

      return TextStylePropertyWidget(
        name: tag,
        property: effectiveStyle,
      );
    },
  );
}
