import 'package:flutter/cupertino.dart';
import 'package:tools/src/tools/color_tools.dart';

double? nullableDoubleFromJson(String? value) => double.tryParse(value ?? '');

int? nullableIntFromJson(String? value) => int.tryParse(value ?? '');

// ignore: prefer_void_to_null
Null toNullJson(dynamic value) => null;

Color? nullableColorFromJson(String? color) {
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
  return null;
}

String? colorToJson(Color? color) {
  return color == null ? null : colorToHex(color);
}

String? nullableValidatorFromJson(dynamic code) {
  return '';
}

String? validatorToJson(dynamic value) {
  return '';
}

bool boolFromJson(dynamic value) {
  const Set<dynamic> falsyValues = <dynamic>{
    '',
    0,
    '0',
    'false',
    'null',
    'undefined',
    'no',
    '-',
    false,
    null,
  };
  dynamic formattedValue = value;
  if (formattedValue is String) {
    formattedValue = formattedValue.trim().toLowerCase();
  }
  if (falsyValues.contains(formattedValue)) {
    return false;
  }
  return true;
}

bool? nullableBoolFromJson(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is String) {
    final String string = value.trim().toLowerCase();
    if (string == 'null' || string == 'undefined') {
      return null;
    }
  }
  return boolFromJson(value);
}
