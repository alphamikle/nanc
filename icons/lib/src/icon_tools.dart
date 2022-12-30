import 'package:flutter/cupertino.dart';
import 'package:icons/src/icon_pack.dart';

IconData getIconByName(String iconName) => iconPackMap[iconName]!;

bool isIconExist(String iconName) => iconPackMap.containsKey(iconName);

IconData? tryToGetIconByName(String? iconName) {
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
  int delayCounter = 0;
  final List<IconData> icons = [];
  final RegExp iconNameRegExp = RegExp(iconName);
  for (final MapEntry<String, IconData> entry in iconPackMap.entries) {
    if (iconNameRegExp.hasMatch(entry.key)) {
      icons.add(entry.value);
    }
    delayCounter++;
    if (delayCounter >= 50) {
      delayCounter = 0;
      await Future<void>.delayed(Duration.zero);
    }
  }
  return icons;
}
