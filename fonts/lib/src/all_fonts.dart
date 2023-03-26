import 'package:fonts/src/custom_fonts.dart';
import 'package:fonts/src/google_fonts.dart';

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
