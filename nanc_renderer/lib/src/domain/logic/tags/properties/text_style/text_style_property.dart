import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:tools/tools.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import 'text_decoration_enum.dart';
import 'text_style_arguments.dart';
import 'text_style_property_widget.dart';

FontWeight? _mapFontWeight(FontWeightEnum? weight) {
  if (weight == null) {
    return null;
  } else if (weight == FontWeightEnum.normal) {
    return FontWeight.normal;
  } else if (weight == FontWeightEnum.bold) {
    return FontWeight.bold;
  } else if (weight == FontWeightEnum.w100) {
    return FontWeight.w100;
  } else if (weight == FontWeightEnum.w200) {
    return FontWeight.w200;
  } else if (weight == FontWeightEnum.w300) {
    return FontWeight.w300;
  } else if (weight == FontWeightEnum.w400) {
    return FontWeight.w400;
  } else if (weight == FontWeightEnum.w500) {
    return FontWeight.w500;
  } else if (weight == FontWeightEnum.w600) {
    return FontWeight.w600;
  } else if (weight == FontWeightEnum.w700) {
    return FontWeight.w700;
  } else if (weight == FontWeightEnum.w800) {
    return FontWeight.w800;
  } else if (weight == FontWeightEnum.w900) {
    return FontWeight.w900;
  }
  return null;
}

TextDecoration? _mapFontDecoration(TextDecorationEnum? decoration) {
  if (decoration == null) {
    return null;
  } else if (decoration == TextDecorationEnum.none) {
    return TextDecoration.none;
  } else if (decoration == TextDecorationEnum.lineThrough) {
    return TextDecoration.lineThrough;
  } else if (decoration == TextDecorationEnum.overline) {
    return TextDecoration.overline;
  } else if (decoration == TextDecorationEnum.underline) {
    return TextDecoration.underline;
  }
  return null;
}

PropertyTagRenderer<TextStyle> textStyleProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, md.Element element, RichRenderer renderer) {
      final TextStyleArguments arguments = TextStyleArguments.fromJson(element.attributes);
      late TextStyle effectiveStyle;
      if (arguments.font != null && arguments.font!.trim().isNotEmpty) {
        try {
          if (isCustomFontExist(arguments.font!)) {
            final CustomFont customFont = getCustomFont(arguments.font!);
            effectiveStyle = TextStyle(fontFamily: customFont.font, package: customFont.package);
          } else if (isGoogleFontExist(arguments.font!)) {
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
        fontWeight: _mapFontWeight(arguments.weight),
        decoration: _mapFontDecoration(arguments.decoration),
        overflow: arguments.overflow,
        textBaseline: arguments.baseline,
      );

      return TextStylePropertyWidget(
        name: tag,
        property: effectiveStyle,
      );
    },
  );
}
