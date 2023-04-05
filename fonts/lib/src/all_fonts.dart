import 'custom_fonts.dart';
import 'google_fonts.dart';

String? tryToGetFontByName(String? font) {
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
