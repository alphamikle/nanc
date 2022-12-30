import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

final List<EnumValue> iconsEnums = () {
  final List<EnumValue> values = [];
  for (final MapEntry<String, IconData> entry in iconPackMap.entries) {
    values.add(EnumValue(title: entry.key, value: entry.value));
  }
  return values;
}();

Future<List<EnumValue>> iconFinder(String iconNameQuery) async {
  final String prettyQuery = iconNameQuery.toLowerCase();
  if (prettyQuery.trim().isEmpty) {
    return iconsEnums;
  }
  final RegExp iconNameRegExp = RegExp(iconNameQuery.toLowerCase());
  final List<EnumValue> response = [];
  for (int i = 0; i < iconsEnums.length; i++) {
    final EnumValue value = iconsEnums[i];
    if (iconNameRegExp.hasMatch(value.title.toLowerCase())) {
      response.add(value);
    }
    if (i % 50 == 0) {
      await wait();
    }
  }
  return response;
}
