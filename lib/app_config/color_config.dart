import 'package:flutter/material.dart';

import 'app_config.dart';

class ColorConfig {
  static const Color primaryColor = Color(0xFFD32F2F); // Red 700
  static const Color secondaryColor = Color(0xFFEF5350); // Red 400
  static const Color accentColor = Color(0xFFFFF1F0); // Subtle red tint
  static const Color backgroundColor = Color(0xFFFFFBFA);

  static const Color popupColor = Colors.white;
  static const Color buttonColor = Color(0xFFD32F2F);
  static const Color popupMenuButtonColor = Color(0xFFFFF1F0);

  static ButtonStyle darkModeButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white10;
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.all(Colors.white),
  );

  static ThemeData quranLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: accentColor, width: 3),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: backgroundColor,
      indicatorColor: accentColor.withValues(alpha: 0.5),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ),
    fontFamily: AppConfig.appDefaultFont,
  );

  static ThemeData quranDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.dark,
      surface: const Color(0xFF121212),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF1F1F1F), // Dark surface
      foregroundColor: Colors.white,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF1F1F1F),
      indicatorColor: primaryColor.withValues(alpha: 0.5),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white70),
      ),
      iconTheme:
          WidgetStateProperty.all(const IconThemeData(color: Colors.white70)),
    ),
    fontFamily: AppConfig.appDefaultFont,
  );
}
