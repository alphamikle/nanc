import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:basic_utils/basic_utils.dart' as bu;
import 'package:path/path.dart' as p;

const String kReload = 'reload';
const String kRename = 'rename';
const String kOptimize = 'optimize';
const String kCompileToSI = 'compile';
const String kGenerateCode = 'generate';

final List<String> outputFileContent = [
  'abstract class IconPack {',
];
final List<String> outputIconMapContent = [
  '',
  'const Map<String, String> iconPackNameToIconPathMap = {',
];

final Set<String> scalableImagesNames = {};
final List<File> rawSvgFiles = [];
final List<File> optimizedSvgFiles = [];
final List<File> compiledScalableImages = [];

final RegExp iconNameRegExp = RegExp(r'^.*/(?<grand>.*)/(?<parent>.*)/(?<file>.*\.svg)$');
final RegExp sIconNameRegExp = RegExp(r'^.*/(?<file>.*)\.(svg|si)$');
final RegExp tokensReplacerRegExp = RegExp(r'(_{2,})|([^\d\w])');

final ArgParser parser = ArgParser();
late final ArgResults results;

Future<void> main(List<String> arguments) async {
  parser.addFlag(kReload, abbr: 'r');
  parser.addFlag(kRename, abbr: 'n');
  parser.addFlag(kOptimize, abbr: 'o');
  parser.addFlag(kCompileToSI, abbr: 's');
  parser.addFlag(kGenerateCode, abbr: 'g');
  results = parser.parse(arguments);
  final bool needToReloadIcons = arg(kReload);
  final bool needToRenameIcons = arg(kRename);
  final bool needToOptimizeIcons = arg(kOptimize);
  final bool needToCompileToSI = arg(kCompileToSI);
  final bool needToGenerateTheCode = arg(kGenerateCode);

  if (needToReloadIcons) {
    await exportIconsFromFigma();
  }
  if (needToRenameIcons) {
    await findFiles();
    await renameIcons();
  }
  if (needToOptimizeIcons) {
    await findFiles();
    await optimizeSvg();
  }
  if (needToCompileToSI) {
    await findFiles();
    await compileToSI();
  }
  if (needToGenerateTheCode) {
    await findFiles();
    await generateCode();
  }
}

/// ? COMMANDS
/// ! STEP 1
Future<void> exportIconsFromFigma() async {
  logg('Reload icons...');
  await cmd('npm run export');
}

/// ! STEP 2
Future<void> renameIcons() async {
  int i = 0;
  final int total = rawSvgFiles.length;
  final Directory outputDir = Directory(p.join(p.current, 'solar_icons_raw'));
  if (!outputDir.existsSync()) {
    outputDir.createSync();
  }
  for (final File svgFile in rawSvgFiles) {
    i++;
    final RegExpMatch? match = iconNameRegExp.firstMatch(svgFile.path);
    if (match == null) {
      throw Exception('Strange file name: ${svgFile.path}');
    }
    final String grandDirectoryName = match.namedGroup('grand')!.trim().toLowerCase().replaceAll(tokensReplacerRegExp, '_');
    String iconName = match.namedGroup('file')!.trim().toLowerCase().replaceAll(tokensReplacerRegExp, '_').replaceAll('.svg', '');
    if (iconName.isEmpty || iconName == '_') {
      /// ? Fix bug for the empty title icon with "person"
      iconName = 'person';
    }
    if (scalableImagesNames.contains(iconName)) {
      logg('Found a copy of icon: $iconName');
      return;
    }
    scalableImagesNames.add(iconName);
    final String resultIconName = '${iconName}_$grandDirectoryName.svg'.replaceAll(tokensReplacerRegExp, '_');
    final String outputPath = p.join(p.current, 'solar_icons_raw', resultIconName);
    svgFile.copySync(outputPath);
    logg('\rFile: $i of $total is ready');
  }
}

/// ! STEP 3
Future<void> optimizeSvg() async {
  logg('Optimize svg');
  await cmd('npm run optimize_solar_icons');
}

/// ! STEP 4
Future<void> compileToSI() async {
  int i = 0;
  final int total = optimizedSvgFiles.length;
  for (final File file in optimizedSvgFiles) {
    i++;
    await cmd('dart run jovial_svg:svg_to_si ${file.path} -o ${p.join(p.current, 'assets', 'sicons')}');
    logg('$i / $total file (${getFileName(file.path)}) converted to scalable image');
  }
}

/// ! STEP 5
Future<void> generateCode() async {
  for (final File file in compiledScalableImages) {
    final String name = getFileName(file.path);
    addSIconCodeData(iconName: name, outDir: 'packages/icons/assets/sicons');
  }
  outputFileContent.addAll([
    '}',
  ]);
  outputFileContent.addAll(outputIconMapContent);
  outputFileContent.addAll([
    '};',
  ]);
  final File iconPackFile = File(p.join(p.current, 'lib', 'src', 'icon_pack.dart'));
  iconPackFile.writeAsStringSync(outputFileContent.join('\n'));
}

void addSIconCodeData({required String iconName, required String outDir}) {
  String clearIconName = iconName.replaceAll(RegExp(r'[)(,]'), '_');
  if (clearIconName.contains(RegExp(r'\d'))) {
    clearIconName = clearIconName.replaceAllMapped(RegExp(r'^(?<number>\d)'), (Match match) {
      if (match is RegExpMatch) {
        final String number = match.namedGroup('number')!;
        return '\$$number';
      }
      return match.input;
    });
  }
  final String codeIconName = toCamelCase(clearIconName);
  outputFileContent.add("  static const $codeIconName = '$outDir/$iconName.si';");
  outputIconMapContent.add("  '${codeIconName.replaceFirst(r'$', '')}': IconPack.$codeIconName,");
}

/// ? TOOLS
Future<void> cmd(String command) async {
  final List<String> arguments = command.split(' ');
  final String executable = arguments.removeAt(0);
  final Process process = await Process.start(executable, arguments, workingDirectory: p.current);
  final StreamSubscription<List<int>> stdOutSubscription = process.stdout.listen((List<int> event) => stdout.add(event));
  final StreamSubscription<List<int>> stdErrSubscription = process.stderr.listen((List<int> event) => stderr.add(event));
  await process.exitCode;
  await stdOutSubscription.cancel();
  await stdErrSubscription.cancel();
}

void logg(Object? object) {
  // ignore: avoid_print
  print(object);
}

T arg<T>(String name) => results[name] as T;

String toCamelCase(String string) {
  final String capitalized = bu.StringUtils.capitalize(string.split('_').join(' '), allWords: true).replaceAll(' ', '');
  return [capitalized.substring(0, 1).toLowerCase(), capitalized.substring(1)].join();
}

Future<List<File>> scanDir(String dirPath, {RegExp? fileRegExp}) async {
  final List<File> files = [];
  final Directory targetDir = Directory(dirPath);
  final List<FileSystemEntity> possiblyFiles = await targetDir.list(recursive: true).toList();
  for (final FileSystemEntity possiblyFile in possiblyFiles) {
    if (possiblyFile is File && (fileRegExp == null || fileRegExp.hasMatch(possiblyFile.path))) {
      files.add(possiblyFile);
    }
  }
  return files;
}

String getFileName(String filePath) {
  final RegExpMatch? match = sIconNameRegExp.firstMatch(filePath);
  if (match == null) {
    throw Exception('Incorrect file name: "$filePath"');
  }
  return match.namedGroup('file')!;
}

Future<void> findFiles() async {
  rawSvgFiles.clear();
  optimizedSvgFiles.clear();
  compiledScalableImages.clear();

  rawSvgFiles.addAll(await scanDir(p.join(p.current, 'output'), fileRegExp: RegExp(r'svg$')));
  optimizedSvgFiles.addAll(await scanDir(p.join(p.current, 'solar_icons'), fileRegExp: RegExp(r'svg$')));
  compiledScalableImages.addAll(await scanDir(p.join(p.current, 'assets', 'sicons'), fileRegExp: RegExp(r'si$')));

  logg('Found ${rawSvgFiles.length} raw svg files');
  logg('Found ${optimizedSvgFiles.length} optimized svg files');
  logg('Found ${compiledScalableImages.length} compiled scalable images files');
}
