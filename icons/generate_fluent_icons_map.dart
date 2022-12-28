// ignore_for_file: file_names

import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  final List<String> output = [
    "import 'package:fluentui_system_icons/fluentui_system_icons.dart';",
    "import 'package:flutter/material.dart';",
    '',
    'final Map<String, IconData> fluentDesignIcons = {',
  ];
  final String path = arguments.first;
  final File fluentIconsFile = File(path);
  final RegExp iconRegExp = RegExp(r'static const IconData (?<name>\w+) ');
  final List<String> lines = fluentIconsFile.readAsLinesSync();
  for (final String line in lines) {
    final RegExpMatch? match = iconRegExp.firstMatch(line);
    if (match != null) {
      final String iconName = match.namedGroup('name')!;
      output.add("  '$iconName': FluentIcons.$iconName,");
    }
  }
  output.add('};');
  final File outputFile = File(p.join(p.current, 'lib', 'service', 'ui_kit', 'kit_icons', 'fluent_icons_map.dart'));
  outputFile.writeAsStringSync(output.join('\n'));
}
