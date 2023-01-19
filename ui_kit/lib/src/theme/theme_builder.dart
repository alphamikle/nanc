import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_kit/src/constants/gap.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';
import 'package:ui_kit/src/theme/kit_input_decorations.dart';

ThemeData themeBuilder(BuildContext context, {bool dark = false}) {
  final builder = dark ? FlexThemeData.dark : FlexThemeData.light;

  return builder(
    scheme: FlexScheme.brandBlue,
    surfaceMode: FlexSurfaceMode.level,
    blendLevel: 20,
    useMaterial3: true,
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    textTheme: GoogleFonts.ubuntuTextTheme(),
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
    ),
    extensions: [
      KitColors(
        successColor: dark ? const Color.fromRGBO(75, 181, 67, 1) : const Color.fromRGBO(75, 181, 67, 1),
        deleteFieldColor: dark ? const Color.fromRGBO(246, 157, 127, 1) : const Color.fromRGBO(246, 157, 127, 1),
        editFieldColor: dark ? const Color.fromRGBO(182, 198, 73, 1) : const Color.fromRGBO(182, 198, 73, 1),
        warning: const Color.fromRGBO(255, 153, 102, 1),
      ),
      KitBorders(
        smallRadius: BorderRadius.circular(Gap.small),
        middleRadius: BorderRadius.circular(6),
        largeRadius: BorderRadius.circular(Gap.regular),
        extraRadius: BorderRadius.circular(Gap.large),
        circleRadius: BorderRadius.circular(100),
      ),
      KitInputDecorations(),
    ],
  );
}
