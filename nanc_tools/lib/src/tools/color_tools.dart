import 'dart:math';

import 'package:flutter/material.dart';

const String _kCompleteValidHexPattern = r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$';

String _padRadix(int value) => value.toRadixString(16).padLeft(2, '0');

Color? colorFromHex(String inputString, {bool enableAlpha = true}) {
  final RegExp hexValidator = RegExp(_kCompleteValidHexPattern);
  if (!hexValidator.hasMatch(inputString)) return null;
  String hexToParse = inputString.replaceFirst('#', '').toUpperCase();
  if (!enableAlpha && hexToParse.length == 8) {
    hexToParse = 'FF${hexToParse.substring(2)}';
  }
  if (hexToParse.length == 3) {
    hexToParse = hexToParse.split('').expand((i) => [i * 2]).join();
  }
  if (hexToParse.length == 6) hexToParse = 'FF$hexToParse';
  final intColorValue = int.tryParse(hexToParse, radix: 16);
  if (intColorValue == null) return null;
  final color = Color(intColorValue);
  return enableAlpha ? color : color.withAlpha(255);
}

String colorToHex(
  Color color, {
  bool includeHashSign = false,
  bool enableAlpha = true,
  bool toUpperCase = true,
}) {
  final String hex =
      (includeHashSign ? '#' : '') + (enableAlpha ? _padRadix(color.alpha) : '') + _padRadix(color.red) + _padRadix(color.green) + _padRadix(color.blue);
  return toUpperCase ? hex.toUpperCase() : hex;
}

extension ExtraColor on Color? {
  Color? shift(int value) {
    if (this == null) {
      return null;
    }
    return Color.fromRGBO(
      max(min(this!.red + value, 255), 0),
      max(min(this!.green + value, 255), 0),
      max(min(this!.blue + value, 255), 0),
      this!.opacity,
    );
  }
}
