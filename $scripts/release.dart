import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as p;

/// ? PACKAGES
const String client = 'nanc_client';
const String backend = 'nanc_backend';

/// ? FLAGS
const String buildClient = 'build-client';
const String createClientWeb = 'create-client-web';
const String createClientApk = 'create-client-apk';
const String createClientAab = 'create-client-aab';
const String buildBackend = 'build-backend';

final ArgParser parser = ArgParser();
late final ArgResults results;

final Map<String, bool> flags = {
  buildClient: false,
  createClientWeb: false,
  createClientApk: false,
  createClientAab: false,
  buildBackend: false,
};

bool get releaseClient => flags[buildClient]!;
bool get buildClientWeb => flags[createClientWeb]!;
bool get buildClientApk => flags[createClientApk]!;
bool get buildClientAab => flags[createClientAab]!;
bool get releaseBackend => flags[buildBackend]!;

Future<void> main(List<String> arguments) async {
  parseArguments(arguments);
  if (releaseClient) {
    increaseNumber(client);
    // await rebuildPackage(client);
    // if (buildClientWeb) {
    //   await buildPackageForWeb(client);
    // }
    // if (buildClientApk) {
    //   // await cmd();
    // }
  }
  if (releaseBackend) {
    increaseNumber(backend);
  }
}

void increaseNumber(String package) {
  final File pubspecFile = File(p.join(p.current, package, 'pubspec.yaml'));
  final String content = pubspecFile.readAsStringSync();
  final RegExp versionRegExp = RegExp(r'version: (?<version>\d{1,3}.\d{1,3}.\d{1,3})\+(?<build>\d{1,3})');
  final RegExpMatch? oldVersionMatch = versionRegExp.firstMatch(content);
  if (oldVersionMatch == null) {
    throw Exception('Not found version at pubspec.yaml');
  }
  final String oldVersion = oldVersionMatch.namedGroup('version')!;
  final String oldBuild = oldVersionMatch.namedGroup('build')!;
  pubspecFile.writeAsStringSync(content.replaceFirst(versionRegExp, 'version: $oldVersion+${int.parse(oldBuild) + 1}'));
}

void parseArguments(List<String> arguments) {
  parser.addFlag(buildClient, abbr: 'c');
  parser.addFlag(createClientWeb, abbr: 'w');
  parser.addFlag(createClientApk, abbr: 'k');
  parser.addFlag(createClientAab, abbr: 'a');
  parser.addFlag(buildBackend, abbr: 'b');
  results = parser.parse(arguments);
  final List<String> flagKeys = flags.keys.toList();
  for (final String key in flagKeys) {
    flags[key] = arg(key);
    logg('${key.toUpperCase()}: ${flags[key]! ? 'YES' : 'NO'}');
  }
}

Future<void> rebuildPackage(String package) async {
  final String dir = p.join(p.current, package);
  await cmd('flutter clean', dir: dir);
  await cmd('flutter pub get', dir: dir);
  await cmd('flutter pub run build_runner build --delete-conflicting-outputs', dir: dir);
}

Future<void> buildPackageForWeb(String package) async {
  final String dir = p.join(p.current, package);
  await cmd(
    r'''
flutter build web
--no-pub
--dart2js-optimization=O4
--dart-define=SUPA_HOST="$NANC_SUPA_HOST"
--dart-define=SUPA_KEY="$NANC_SUPA_KEY"
--dart-define="$NANC_SECRET_KEY"="$NANC_SECRET_VALUE"
--web-renderer=canvaskit
''',
    dir: dir,
  );
  final String output = package == client
      ? 'CLIENT'
      : package == backend
          ? 'BACKEND'
          : throw Exception('Unknown package: $package');
  await cmd(
    '''
cp -R ./build/web/ "\$NANC_${output}_REPO" &&
cp -R ./build/web/ "\$NANC_${output}_REPO" &&
cd "\$NANC_${output}_REPO" &&
git add . &&
git commit -m "$package release" &&
git push
''',
    dir: dir,
  );
}

/// ? TOOLS
Future<void> cmd(String command, {String? dir}) async {
  if (command.contains('&&')) {
    final List<String> commands = command.split('&&');
    for (final String command in commands) {
      await cmd(command, dir: dir);
    }
    return;
  }
  final List<String> arguments = command.split(RegExp(r' |\s')).map((String it) => it.trim()).toList();
  final String executable = arguments.removeAt(0);
  final Process process = await Process.start(executable, arguments, workingDirectory: dir ?? p.current);
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
