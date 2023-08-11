import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

final List<EnumValue> iconsEnums = () {
  final List<EnumValue> values = [];

  final Iterable<MapEntry<String, IconData>> icons = IconsStorage.allIcons.entries;

  for (final MapEntry<String, IconData> entry in icons) {
    values.add(EnumValue(title: entry.key, value: entry.value));
  }
  return values;
}();

Future<List<EnumValue>> iconFinder(String iconNameQuery) async {
  final String prettyQuery = iconNameQuery.toLowerCase();
  if (prettyQuery.trim().isEmpty) {
    return iconsEnums;
  }
  try {
    final RegExp iconNameRegExp = RegExp(prettyQuery);
    final List<EnumValue> response = [];
    for (int i = 0; i < iconsEnums.length; i++) {
      final EnumValue value = iconsEnums[i];
      if (iconNameRegExp.hasMatch(value.title.toLowerCase())) {
        response.add(value);
      }
      await wait(periodic: true);
    }
    return response;
  } catch (error) {
    /// ! At this point user inputs some incorrect, what broke up a reg exp - lets use query as a usual string
    final List<EnumValue> response = [];
    for (int i = 0; i < iconsEnums.length; i++) {
      final EnumValue value = iconsEnums[i];
      if (value.title.toLowerCase().contains(prettyQuery)) {
        response.add(value);
      }
      await wait(periodic: true);
    }
    return response;
  }
}
