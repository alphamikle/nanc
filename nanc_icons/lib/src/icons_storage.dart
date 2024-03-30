import 'package:flutter/cupertino.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'icon_pack.dart';

abstract final class IconsStorage {
  static const Map<String, IconData> _defaultIcons = iconPackMap;
  static final Map<String, IconData> _customIcons = {};

  static final Map<String, IconData> allIcons = {..._customIcons, ..._defaultIcons};

  static void registerCustomIcons(Map<String, IconData> customIcons) {
    _customIcons.addAll(customIcons);
  }

  static IconData getIconByName(String iconName) {
    return allIcons[iconName]!;
  }

  static bool isIconExist(String iconName) {
    return allIcons.containsKey(iconName);
  }

  static IconData? tryToGetIconByName(String? iconName) {
    if (iconName == null) {
      return null;
    }
    if (isIconExist(iconName)) {
      return getIconByName(iconName);
    }
    return null;
  }

  Future<List<IconData>> findIconsByQuery(String? iconName) async {
    if (iconName == null) {
      return [];
    }
    final List<IconData> icons = [];
    final RegExp iconNameRegExp = RegExp(iconName);
    for (final MapEntry<String, IconData> entry in allIcons.entries) {
      if (iconNameRegExp.hasMatch(entry.key)) {
        icons.add(entry.value);
      }
      await wait(duration: Duration.zero, periodic: true);
    }
    return icons;
  }
}
