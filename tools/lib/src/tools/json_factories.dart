import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tools/src/tools/color_tools.dart';

double? stringToDoubleOrNull(String? value) => double.tryParse(value ?? '');

int? intFromJson(String? value) => int.tryParse(value ?? '');

// ignore: prefer_void_to_null
Null toNullJson(dynamic value) => null;

Color? colorFromJson(String? color) {
  if (color == null) {
    return null;
  }
  final Color? tempColor = colorFromHex(color);
  if (tempColor != null) {
    return tempColor;
  }
  final RegExp hexRegExp = RegExp(r'^((0x)|(#))?([a-fA-F\d]{8})|(?<short>[a-fA-F\d]{6})$');
  final RegExpMatch? hexMatch = hexRegExp.firstMatch(color);
  if (hexMatch != null) {
    String clearColor = color;
    if (clearColor.startsWith('#')) {
      clearColor = clearColor.replaceFirst('#', '0x');
    } else if (clearColor.startsWith('0x')) {
      // DO NOTHING
    } else {
      clearColor = '0x$clearColor';
    }

    /// ? If input color was like: 00A63A
    if (clearColor.length == 8 && hexMatch.namedGroup('short') != null) {
      clearColor = '0xFF${hexMatch.namedGroup('short')}';
    }
    return Color(int.parse(clearColor));
  }
  log('Unsupported Color format: $color', name: 'WARNING');
  return null;
}

String? colorToJson(Color? color) {
  return color == null ? null : colorToHex(color);
}

String? validatorFromJson(dynamic code) {
  return '';
}

String? validatorToJson(dynamic value) {
  return '';
}

bool boolFromJson(dynamic value) {
  final Set<dynamic> plausibleValues = <dynamic>{
    '1',
    'true',
    1,
    true,
    't',
    'ok',
    'yes',
    'y',
    '+',
  };
  dynamic formattedValue = value;
  if (formattedValue is String) {
    formattedValue = formattedValue.toLowerCase().trim();
  }
  if (plausibleValues.contains(formattedValue)) {
    return true;
  }
  return false;
}
