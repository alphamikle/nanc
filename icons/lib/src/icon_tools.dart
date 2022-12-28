import 'package:flutter/cupertino.dart';
import 'package:icons/src/icon_pack.dart';
import 'package:icons/src/icons_content/boxi_icons_map.dart';
import 'package:icons/src/icons_content/fluent_icons_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// TODO(alphamikle): Convert fonts to the SVG and then to the SI
final Set<String> iconsNames = {
  // ...MdiIcons.getIconsName(),
  // ...fluentDesignIcons.keys,
  // ...boxiIcons.keys,
};

IconData getIconByName(String iconName) {
  return MdiIcons.fromString(iconName) ?? fluentDesignIcons[iconName] ?? boxiIcons[iconName] ?? MdiIcons.help;
}

bool isSIcon(String? iconName) => iconPackNameToIconPathMap.containsKey(iconName);

String getSIconByName(String iconName) {
  return iconPackNameToIconPathMap[iconName]!;
}

String? tryToGetIconPathByName(String? iconName) {
  if (iconName == null || iconName.trim().isEmpty) {
    return null;
  }
  if (isSIcon(iconName)) {
    return getSIconByName(iconName);
  }
  return null;
}
