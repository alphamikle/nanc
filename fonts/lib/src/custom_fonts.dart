import 'custom_font.dart';

final Map<String, CustomFont> _fonts = {};

List<String> get customFonts {
  final List<String> customFonts = _fonts.keys.toList();
  customFonts.sort((String first, String second) => first.compareTo(second));
  return customFonts;
}

void registerCustomFont(CustomFont font) => _fonts[font.font] = font;

bool isCustomFontExist(String? font) {
  if (font == null) {
    return false;
  }
  return _fonts.keys.contains(font);
}

CustomFont getCustomFont(String font) {
  assert(_fonts[font] != null);
  return _fonts[font]!;
}

List<CustomFont> findCustomFontsByQuery(String? query) {
  if (query == null) {
    return [];
  }
  final RegExp regExp = RegExp(query);
  final List<CustomFont> fonts = [];
  for (final MapEntry<String, CustomFont> entry in _fonts.entries) {
    if (regExp.hasMatch(entry.key)) {
      fonts.add(entry.value);
    }
  }
  return fonts;
}
