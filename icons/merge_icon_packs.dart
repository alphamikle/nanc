import 'dart:io';

import 'package:args/args.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:path/path.dart' as p;

typedef Parser = Future<void> Function(File iconPackFile);
typedef IconName = String;
typedef IconCode = String;
typedef IconType = String;

final ArgParser parser = ArgParser();
late final ArgResults parsedArguments;

final List<String> iconPackClassCode = [];
final List<String> iconPackNamesClassCode = [];
final List<String> iconMapCode = [];

const String mdi = 'mdi';
const String flu = 'flu';
const String rmx = 'rmx';

/// ? mdi: /Users/alfa/.pub-cache/hosted/pub.dartlang.org/material_design_icons_flutter-6.0.7096/lib/material_design_icons_flutter.dart
/// ? flu: /Users/alfa/.pub-cache/hosted/pub.dartlang.org/fluentui_system_icons-1.1.189/lib/src/fluent_icons.dart
/// ? rmx: /Users/alfa/.pub-cache/hosted/pub.dartlang.org/remixicon-1.0.0/lib/remixicon.dart

final Map<String, Parser> parsers = {
  mdi: mdiParser,
  flu: fluParser,
  rmx: rmxParser,
};

Future<void> main(List<String> arguments) async {
  initArguments(arguments);
  for (final MapEntry<String, Parser> entry in parsers.entries) {
    final String iconPackPath = parsedArguments[entry.key].toString();
    final File iconPackFile = File(iconPackPath);
    if (iconPackFile.existsSync()) {
      await entry.value(iconPackFile);
    } else {
      log('File with path "$iconPackPath" for icon pack "${entry.value}" did not find');
    }
  }
  await createIconPackFile();
}

Future<void> mdiParser(File file) async {
  final List<RegExpMatch> matches = findMatches(
    file: file,
    regExp: RegExp(r'^ *static const IconData (?<name>\w+) = const _MdiIconData\((?<code>\w+)\);$', multiLine: true),
  );
  int counter = 0;
  for (final RegExpMatch match in matches) {
    final String name = match.namedGroup('name')!;
    final String code = match.namedGroup('code')!;
    final String snackCaseName = StringUtils.camelCaseToLowerUnderscore(name);
    final String iconData = generateIconData(codePoint: code, fontFamily: 'Material Design Icons', fontPackage: 'material_design_icons_flutter');
    iconPackClassCode.addAll([
      '  static const ${mdi}_$snackCaseName = $iconData;',
    ]);
    counter++;
  }
  log('Added $counter mdi icons');
}

Future<void> fluParser(File file) async {
  final List<RegExpMatch> matches = findMatches(
    file: file,
    regExp: RegExp(r"^ *static const IconData (?<name>\w+24\w+) = IconData\((?<code>\w+), fontFamily: '(?<family>[-\w]+)'.*;$", multiLine: true),
  );
  int counter = 0;
  for (final RegExpMatch match in matches) {
    final String name = match.namedGroup('name')!;
    final String code = match.namedGroup('code')!;
    final String fontFamily = match.namedGroup('family')!;
    final String clearName = name.replaceFirst('_24', '');
    final String iconData = generateIconData(codePoint: code, fontFamily: fontFamily, fontPackage: 'fluentui_system_icons');
    iconPackClassCode.addAll([
      '  static const ${flu}_$clearName = $iconData;',
    ]);
    counter++;
  }
  log('Added $counter flu icons');
}

Future<void> rmxParser(File file) async {
  final List<RegExpMatch> matches = findMatches(
    file: file,
    regExp: RegExp(r'static const IconData (?<name>\w+) =\n *IconData\((?<code>\w+),', multiLine: true),
  );
  int counter = 0;
  for (final RegExpMatch match in matches) {
    final String name = match.namedGroup('name')!;
    final String code = match.namedGroup('code')!;
    final String iconData = generateIconData(codePoint: code, fontFamily: 'Remix', fontPackage: 'remixicon');
    iconPackClassCode.addAll([
      '  static const ${rmx}_$name = $iconData;',
    ]);
    counter++;
  }
  log('Added $counter rmx icons');
}

Future<void> createIconPackFile() async {
  final RegExp iconNameRegExp = RegExp(r'static const (?<name>\w+) =');
  iconPackClassCode.sort((String first, String second) => first.compareTo(second));
  for (final String iconCodeRow in iconPackClassCode) {
    final RegExpMatch? match = iconNameRegExp.firstMatch(iconCodeRow);
    if (match != null) {
      final String iconName = match.namedGroup('name')!;
      iconMapCode.addAll([
        "  '$iconName': IconPack.$iconName,",
      ]);
      iconPackNamesClassCode.addAll([
        "  static const $iconName = '$iconName';",
      ]);
    }
  }
  iconMapCode.insertAll(0, [
    'const Map<String, IconData> iconPackMap = {',
  ]);
  iconMapCode.addAll([
    '};',
  ]);
  iconPackNamesClassCode.insertAll(0, [
    'abstract class IconPackNames {',
  ]);
  iconPackNamesClassCode.addAll([
    '}',
  ]);
  iconPackClassCode.insertAll(0, [
    '/// ? THIS IS A GENERATED FILE; DONT CHANGE IT BY HAND',
    '// ignore_for_file: type=lint',
    '',
    "import 'package:flutter/material.dart';"
        '',
    '',
    'abstract class IconPack {',
  ]);
  iconPackClassCode.addAll([
    '}',
    '',
    ...iconPackNamesClassCode,
    '',
    ...iconMapCode,
  ]);
  final File iconPackFile = File(p.join(p.current, 'lib', 'src', 'icon_pack.dart'));
  iconPackFile.writeAsStringSync(iconPackClassCode.join('\n'));
}

void initArguments(List<String> arguments) {
  parser.addOption(mdi);
  parser.addOption(flu);
  parser.addOption(rmx);
  parsedArguments = parser.parse(arguments);
}

List<RegExpMatch> findMatches({required File file, required RegExp regExp}) {
  final Iterable<RegExpMatch> matches = regExp.allMatches(file.readAsStringSync());
  return matches.toList();
}

String generateIconData({
  required String codePoint,
  required String fontFamily,
  required String fontPackage,
}) {
  return "IconData($codePoint, fontFamily: '$fontFamily', fontPackage: '$fontPackage')";
}

void log(Object? object) {
  // ignore: avoid_print
  print(object);
}
