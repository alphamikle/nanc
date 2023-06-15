// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart';

const Set<String> excludedUiKitPatterns = {
  'theme',
};

void main() {
  final Set<String> uiKitFolders = Directory(join(current, 'ui_kit', 'lib', 'src', 'domain'))
      .listSync()
      .whereType<Directory>()
      .where((Directory directory) => excludedUiKitPatterns.every((String pattern) => RegExp(pattern).hasMatch(directory.path) == false))
      .map((Directory it) => it.name)
      .toSet();
  final Set<String> storybookFolders =
      Directory(join(current, 'storybook', 'lib', 'src', 'domain', 'ui')).listSync().whereType<Directory>().map((Directory it) => it.name).toSet();
  final Iterable<String> notImplementedStories = uiKitFolders.where((String uiKitFolder) => storybookFolders.contains(uiKitFolder) == false);
  if (notImplementedStories.isNotEmpty) {
    print('[ERROR] There are found ui_kit stories, which are not implemented at storybook:\n${notImplementedStories.join('\n')}');
    exit(1);
  }

  final Map<String, File> uiKitFilesCache = {};
  final Set<String> uiKitFiles = Directory(join(current, 'ui_kit', 'lib', 'src', 'domain'))
      .listSync(recursive: true)
      .whereType<File>()
      .where((File file) => excludedUiKitPatterns.every((String pattern) => RegExp(pattern).hasMatch(file.path) == false))
      .map(
    (File it) {
      uiKitFilesCache[it.name] = it;
      return it.name;
    },
  ).toSet();
  final Set<String> storybookFiles =
      Directory(join(current, 'storybook', 'lib', 'src', 'domain', 'ui')).listSync(recursive: true).whereType<File>().map((File it) => it.name).toSet();
  final Iterable<String> notImplementedComponents =
      uiKitFiles.where((String uiKitFile) => storybookFiles.contains(uiKitFile) == false).map((String path) => uiKitFilesCache[path]?.nameWithParent ?? path);
  if (notImplementedComponents.isNotEmpty) {
    print('[ERROR] There are found ui_kit components, which are not implemented at storybook:\n${notImplementedComponents.join('\n')}');
    exit(1);
  }
}

extension FileSystemNameExtension on FileSystemEntity {
  String get name {
    return path.replaceFirst(parent.path, '');
  }

  String get nameWithParent {
    return parent.name + name;
  }
}
