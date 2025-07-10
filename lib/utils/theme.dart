import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff6962BB), //primary
      primaryContainer: Color(0xfffafafa), // container
      secondary: Color(0xff535353), // text dark
      onSecondary: Color(0xff757575), // text light
      secondaryContainer: Color(0xff332A64), // buttons
      tertiary: Color(0xfff0f0f0), //border
      onTertiary: Color(0xffA79BD8), // support
      tertiaryContainer: Color(0xffffffff),//white
      shadow: Color(0xff000000),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff6962BB), //primary
      primaryContainer: Color(0xfffafafa), // container
      secondary: Color(0xff535353), // text dark
      onSecondary: Color(0xff757575), // text light
      secondaryContainer: Color(0xff332A64), // buttons
      tertiary: Color(0xfff0f0f0), //border
      onTertiary: Color(0xffA79BD8), // support
      tertiaryContainer: Color(0xffffffff),//white
      shadow: Color(0xff000000),
    ),
  );

  static ThemeData customTheme(Color color1, Color color2) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: Color(0xff6962BB), //primary
      primaryContainer: Color(0xfffafafa), // container
      secondary: Color(0xff535353), // text dark
      onSecondary: Color(0xff757575), // text light
      secondaryContainer: Color(0xff332A64), // buttons
      tertiary: Color(0xfff0f0f0), //border
      onTertiary: Color(0xffA79BD8), // support
      tertiaryContainer: Color(0xffffffff),//white
      shadow: Color(0xff000000),
      ),
    );
  }
}
