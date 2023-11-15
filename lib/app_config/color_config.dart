import 'package:flutter/material.dart';

import 'app_config.dart';

class ColorConfig {

  static Color primaryColor = Colors.deepOrange;
  static Color backgroundColor = Colors.deepOrange.shade50;
  static Color popupColor = Colors.deepOrange.shade100;
  static Color buttonColor = Colors.deepOrange.shade700;
  static Color popupMenuButtonColor = Colors.deepOrange.shade100;
  static ButtonStyle darkModeButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.black;
      }
      return Colors.transparent;
    }),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return Colors.transparent;
    }),
  );


  static ThemeData quranLightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.light,
    fontFamily: AppConfig.appDefaultFont,
  );

  static ThemeData quranDarkTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
    fontFamily: AppConfig.appDefaultFont,
  );
}