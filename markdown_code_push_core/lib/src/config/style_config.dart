import 'package:flutter/material.dart';
import 'package:markdown_code_push_core/src/tags/blockquote.dart';
import 'package:markdown_code_push_core/src/tags/code.dart';
import 'package:markdown_code_push_core/src/tags/hr.dart';
import 'package:markdown_code_push_core/src/tags/img.dart';
import 'package:markdown_code_push_core/src/tags/input.dart';
import 'package:markdown_code_push_core/src/tags/markdown_tags.dart';
import 'package:markdown_code_push_core/src/tags/ol.dart';
import 'package:markdown_code_push_core/src/tags/p.dart';
import 'package:markdown_code_push_core/src/tags/pre.dart';
import 'package:markdown_code_push_core/src/tags/table.dart';
import 'package:markdown_code_push_core/src/tags/title.dart';
import 'package:markdown_code_push_core/src/tags/ul.dart';
import 'package:markdown_code_push_core/src/themes/all_themes.dart';

class StyleConfig {
  factory StyleConfig({
    CheckBoxBuilder? checkBoxBuilder,
    ImgBuilder? imgBuilder,
    ImgConfig? imgConfig,
    TitleConfig? titleConfig,
    PConfig? pConfig,
    CodeConfig? codeConfig,
    OlConfig? olConfig,
    UlConfig? ulConfig,
    PreConfig? preConfig,
    BlockQuoteConfig? blockQuoteConfig,
    TableConfig? tableConfig,
    HrConfig? hrConfig,
    CheckBoxConfig? checkBoxConfig,
    Map<String, dynamic>? markdownTheme,
  }) {
    _obj ??= StyleConfig._internal();
    _obj!.imgBuilder = imgBuilder ?? _obj!.imgBuilder;
    _obj!.imgConfig = imgConfig ?? _obj!.imgConfig;
    _obj!.checkBoxBuilder = checkBoxBuilder ?? _obj!.checkBoxBuilder;
    _obj!.titleConfig = titleConfig ?? _obj!.titleConfig;
    _obj!.pConfig = pConfig ?? _obj!.pConfig;
    _obj!.codeConfig = codeConfig ?? _obj!.codeConfig;
    _obj!.olConfig = olConfig ?? _obj!.olConfig;
    _obj!.ulConfig = ulConfig ?? _obj!.ulConfig;
    _obj!.preConfig = preConfig ?? _obj!.preConfig;
    _obj!.blockQuoteConfig = blockQuoteConfig ?? _obj!.blockQuoteConfig;
    _obj!.tableConfig = tableConfig ?? _obj!.tableConfig;
    _obj!.hrConfig = hrConfig ?? _obj!.hrConfig;
    _obj!.checkBoxConfig = checkBoxConfig ?? _obj!.checkBoxConfig;
    _obj!.markdownTheme = markdownTheme ?? _obj!.markdownTheme;
    return _obj!;
  }

  StyleConfig._internal();

  static StyleConfig? _obj;

  ///input
  CheckBoxBuilder? checkBoxBuilder;
  CheckBoxConfig? checkBoxConfig;

  ///img
  ImgBuilder? imgBuilder;
  ImgConfig? imgConfig;

  ///h1~h5
  TitleConfig? titleConfig;

  ///p
  PConfig? pConfig;

  ///code
  CodeConfig? codeConfig;

  ///ol
  OlConfig? olConfig;

  ///ul
  UlConfig? ulConfig;

  ///pre
  PreConfig? preConfig;

  ///blockquote
  BlockQuoteConfig? blockQuoteConfig;

  ///table
  TableConfig? tableConfig;

  ///hr
  HrConfig? hrConfig;

  ///MarkdownTheme, default is light
  Map<String, dynamic>? markdownTheme;
}

class MarkdownTheme {
  static final Map<String, dynamic> lightTheme = lightThemeMap;
  static final Map<String, dynamic> darkTheme = darkThemeMap;
}

///merge the style of [del]、[em]、[strong]
TextStyle getTextStyle(String tag) {
  final pConfig = StyleConfig().pConfig;
  TextStyle style = const TextStyle();
  switch (tag) {
    case del:
      style = pConfig?.delStyle ?? defaultDelStyle;
      break;
    case em:
      style = pConfig?.emStyle ?? defaultEmStyle;
      break;
    case strong:
      style = pConfig?.strongStyle ?? defaultStrongStyle;
      break;
  }
  return style;
}

Map<String, dynamic> get _theme => StyleConfig().markdownTheme ?? lightThemeMap;

/// default style of tag: p
TextStyle? get defaultPStyle => (_theme['PStyle'] ?? lightThemeMap['PStyle']) as TextStyle?;

/// default style of tag: code
TextStyle? get defaultCodeStyle => (_theme['CodeStyle'] ?? lightThemeMap['CodeStyle']) as TextStyle?;

/// default style of delete text
TextStyle get defaultDelStyle => const TextStyle(decoration: TextDecoration.lineThrough);

/// default style of slanting text
TextStyle get defaultEmStyle => const TextStyle(fontStyle: FontStyle.italic);

/// default style of bold text
TextStyle get defaultStrongStyle => const TextStyle(fontWeight: FontWeight.bold);

/// default style of tag: blockquote
TextStyle? get defaultBlockStyle => (_theme['BlockStyle'] ?? lightThemeMap['BlockStyle']) as TextStyle?;

/// default style of tag: a
TextStyle? get defaultLinkStyle => (_theme['LinkStyle'] ?? lightThemeMap['LinkStyle']) as TextStyle?;

/// default background color of tag: code
Color? get defaultCodeBackground => (_theme['CodeBackground'] ?? lightThemeMap['CodeBackground']) as Color?;

/// default border color of tag: table
Color? get defaultTableBorderColor => (_theme['TableBorderColor'] ?? lightThemeMap['TableBorderColor']) as Color?;

/// default divider color of tag: hr and h1~h6
Color? get defaultDividerColor => (_theme['DividerColor'] ?? lightThemeMap['DividerColor']) as Color?;

/// default background color of tag: blockquote
Color? get defaultBlockColor => (_theme['BlockColor'] ?? lightThemeMap['BlockColor']) as Color?;

/// default background color of tag: pre
Color? get defaultPreBackground => (_theme['PreBackground'] ?? lightThemeMap['PreBackground']) as Color?;

/// default text color of tag: h1~h5
Color? get defaultTitleColor => (_theme['TitleColor'] ?? lightThemeMap['TitleColor']) as Color?;

/// default color of unOrderly index widget
Color? get defaultUlDotColor => (_theme['UlDotColor'] ?? lightThemeMap['UlDotColor']) as Color?;

/// default theme of highlight code
Map<String, TextStyle>? get defaultHighLightCodeTheme => (_theme['HightLightCodeTheme'] ?? lightThemeMap['HightLightCodeTheme']) as Map<String, TextStyle>?;
