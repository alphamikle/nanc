import 'package:flutter/material.dart';

enum TextDecorationEnum {
  none,
  underline,
  overline,
  lineThrough;

  TextDecoration toTextDecoration() {
    return switch (this) {
      TextDecorationEnum.none => TextDecoration.none,
      TextDecorationEnum.underline => TextDecoration.underline,
      TextDecorationEnum.overline => TextDecoration.overline,
      TextDecorationEnum.lineThrough => TextDecoration.lineThrough,
    };
  }
}

enum FontWeightEnum {
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900,
  normal,
  bold;

  FontWeight toFontWeight() {
    return switch (this) {
      FontWeightEnum.w100 => FontWeight.w100,
      FontWeightEnum.w200 => FontWeight.w200,
      FontWeightEnum.w300 => FontWeight.w300,
      FontWeightEnum.w400 => FontWeight.w400,
      FontWeightEnum.w500 => FontWeight.w500,
      FontWeightEnum.w600 => FontWeight.w600,
      FontWeightEnum.w700 => FontWeight.w700,
      FontWeightEnum.w800 => FontWeight.w800,
      FontWeightEnum.w900 => FontWeight.w900,
      FontWeightEnum.normal => FontWeight.normal,
      FontWeightEnum.bold => FontWeight.bold,
    };
  }
}
