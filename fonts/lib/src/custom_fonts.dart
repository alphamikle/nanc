import 'package:fonts/src/custom_font.dart';

final Map<String, CustomFont> _customFonts = {};

void registerCustomFont(CustomFont font) => _customFonts[font.font] = font;

bool isCustomFontExist(String? font) {
  if (font == null) {
    return false;
  }
  return _customFonts.keys.contains(font);
}

CustomFont getCustomFont(String font) {
  assert(_customFonts[font] != null);
  return _customFonts[font]!;
}

List<CustomFont> findCustomFontsByQuery(String? query) {
  if (query == null) {
    return [];
  }
  final RegExp regExp = RegExp(query);
  final List<CustomFont> fonts = [];
  for (final MapEntry<String, CustomFont> entry in _customFonts.entries) {
    if (regExp.hasMatch(entry.key)) {
      fonts.add(entry.value);
    }
  }
  return fonts;
}
