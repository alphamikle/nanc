import 'package:google_fonts/google_fonts.dart';
import 'package:tools/tools.dart';

import 'custom_font.dart';

abstract final class FontsStorage {
  static final Set<String> _googleFonts = GoogleFonts.asMap().keys.toSet();
  static final Map<String, CustomFont> _customFonts = {};

  static final List<String> allFonts = _allFonts;

  static List<String> get _allFonts {
    final List<String> allFonts = _customFonts.keys.toList();
    allFonts.sort((String first, String second) => first.compareTo(second));
    allFonts.addAll(_googleFonts);
    return allFonts;
  }

  static void registerCustomFonts(List<CustomFont> customFonts) {
    for (final CustomFont customFont in customFonts) {
      _customFonts[customFont.font] = customFont;
    }
  }

  static bool isCustomFontExist(String? font) {
    if (font == null) {
      return false;
    }
    return _customFonts.keys.contains(font);
  }

  static bool isGoogleFontExist(String? font) {
    if (font == null) {
      return false;
    }
    return _googleFonts.contains(font);
  }

  static CustomFont getCustomFontByName(String font) {
    return _customFonts[font]!;
  }

  static List<CustomFont> findCustomFontsByQuery(String? query) {
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

  Future<List<String>> findGoogleFontsByQuery(String? query) async {
    if (query == null) {
      return [];
    }
    final List<String> fonts = [];
    final RegExp regExp = RegExp(query.toLowerCase());
    for (final String font in _googleFonts) {
      if (regExp.hasMatch(font)) {
        fonts.add(font);
      }
      await wait(duration: Duration.zero, periodic: true);
    }
    return fonts;
  }

  static String? tryToGetFontByName(String? font) {
    if (font == null) {
      return null;
    }
    if (isCustomFontExist(font)) {
      return font;
    }
    if (isGoogleFontExist(font)) {
      return font;
    }
    return null;
  }
}
