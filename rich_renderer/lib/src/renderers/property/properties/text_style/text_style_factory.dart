import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/properties/text_style/text_decoration_enum.dart';
import 'package:rich_renderer/src/renderers/property/properties/text_style/text_style_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/text_style/text_style_property_widget.dart';
import 'package:tools/tools.dart';

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

TextStylePropertyWidget textStyleFactory({
  required BuildContext context,
  required String name,
  required md.Element element,
  required RichRenderer richRenderer,
}) {
  final TextStyleArguments arguments = TextStyleArguments.fromJson(element.attributes);
  late TextStyle effectiveStyle;
  if (arguments.font != null && arguments.font!.trim().isNotEmpty) {
    try {
      effectiveStyle = GoogleFonts.getFont(arguments.font!);
    } catch (error) {
      logg('Error on loading font with name "${arguments.font}": $error');
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
    name: name,
    property: effectiveStyle,
  );
}
