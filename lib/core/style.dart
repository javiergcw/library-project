import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
//import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
//  dividerTheme: DividerThemeData(color: HexColor('#FCF8ED'), space: 0.5),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 40,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 28,
    ),
    //
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  ),

  colorScheme: const ColorScheme(
    primary: UIColors.bluePrimary,
    onPrimary: UIColors.bluePrimary,
    //
    secondary: UIColors.orangePrimary,
    onSecondary: UIColors.orangePrimary,
    //
    tertiary: UIColors.purplePrimary,
    onTertiary: UIColors.purplePrimary,
    //
    brightness: Brightness.light,
    //
    background: Colors.white,
    onBackground: Colors.white,
    //
    error: Colors.black,
    onError: Colors.white,
    //
    surface: UIColors.pinkPrimary,
    onSurface: UIColors.pinkPrimary,
  ),
);
