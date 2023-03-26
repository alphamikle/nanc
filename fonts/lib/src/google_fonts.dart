import 'package:google_fonts/google_fonts.dart';
import 'package:tools/tools.dart';

final Set<String> _fonts = GoogleFonts.asMap().keys.toSet();

List<String> get googleFonts {
  final List<String> googleFonts = _fonts.toList();
  // TODO(alphamikle): Check Sort
  return googleFonts;
}

bool isGoogleFontExist(String? font) {
  if (font == null) {
    return false;
  }
  return _fonts.contains(font);
}

Future<List<String>> findGoogleFontsByQuery(String? query) async {
  if (query == null) {
    return [];
  }
  final List<String> fonts = [];
  final RegExp regExp = RegExp(query.toLowerCase());
  for (final String font in _fonts) {
    if (regExp.hasMatch(font)) {
      fonts.add(font);
    }
    await wait(duration: Duration.zero, periodic: true);
  }
  return fonts;
}
