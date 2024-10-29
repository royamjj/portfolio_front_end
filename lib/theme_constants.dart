import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color colorWhite = HexColor("FFFFFF");
final Color black = HexColor("25252E");
final Color loadingGrey = HexColor("E8E8ED");
final Color backgroundBlack = HexColor("1f1e1e");
final Color orangeSwitch = HexColor("ed8554");
final Color pinkSwitch = HexColor("be375f");

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: colorWhite,
  primaryColor: colorWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundBlack,
    foregroundColor: colorWhite,

  ),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: colorWhite),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: colorWhite),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: colorWhite),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: colorWhite),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: colorWhite),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: colorWhite),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: colorWhite),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: colorWhite),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: colorWhite),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: colorWhite),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: colorWhite),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: colorWhite),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorWhite),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorWhite),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300, color: colorWhite),
  ),
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}