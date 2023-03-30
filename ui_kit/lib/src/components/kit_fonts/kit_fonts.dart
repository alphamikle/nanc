import 'package:fields/fields.dart';
import 'package:fonts/fonts.dart';
import 'package:tools/tools.dart';

final List<EnumValue> fontEnums = () {
  final List<EnumValue> values = [];
  final List<String> allFonts = [...customFonts, ...googleFonts];
  for (final String font in allFonts) {
    values.add(EnumValue(title: font, value: font));
  }
  return values;
}();

Future<List<EnumValue>> fontFinder(String iconNameQuery) async {
  final String prettyQuery = iconNameQuery.toLowerCase();
  if (prettyQuery.trim().isEmpty) {
    return fontEnums;
  }
  final RegExp iconNameRegExp = RegExp(iconNameQuery.toLowerCase());
  final List<EnumValue> response = [];
  for (int i = 0; i < fontEnums.length; i++) {
    final EnumValue value = fontEnums[i];
    if (iconNameRegExp.hasMatch(value.title.toLowerCase())) {
      response.add(value);
    }
    await wait(periodic: true);
  }
  return response;
}