import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

final List<EnumValue> iconsEnums = () {
  final List<EnumValue> iconEnums = iconsNames.map((String iconName) {
    return EnumValue(title: iconName, value: getIconByName(iconName));
  }).toList();
  final List<EnumValue> scalableIconEnums = iconPackNameToIconPathMap.entries.map((e) {
    return EnumValue(title: e.key, value: e.value);
  }).toList();
  return [...scalableIconEnums, ...iconEnums];
}();

Future<List<EnumValue>> iconFinder(String iconNameQuery) async {
  final String prettyQuery = iconNameQuery.toLowerCase();
  if (prettyQuery.trim().isEmpty) {
    return iconsEnums;
  }
  final List<EnumValue> response = [];
  for (int i = 0; i < iconsEnums.length; i++) {
    final EnumValue value = iconsEnums[i];
    if (value.title.toLowerCase().contains(prettyQuery)) {
      response.add(value);
    }
    if (i % 25 == 0) {
      await wait();
    }
  }
  return response;
}
