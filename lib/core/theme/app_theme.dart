import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF2454D8);
  static const Color backgroundBlue = Color(0xFFEAF3FF);
  static const Color selectedBlue = Color(0xFFD7E2FA);
  static const Color primaryText = Color(0xFF172033);
  static const Color mutedText = Color(0xFF6B7280);

  static const Color waterBlue = Color(0xFF69A8F7);
  static const Color waterBlueLight = Color(0xFF9DCCFA);

  static const Color goalCardBlueLight = Color(0xFF5FA3F3);
  static const Color sliderInactive = Color(0xFFDDE2EC);
  static const Color wakeUpOrange = Color(0xFFFF9800);
  static const Color dividerGray = Color(0xFF909092);

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundBlue,
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      onPrimary: Colors.white,
      primaryContainer: selectedBlue,
      onPrimaryContainer: primaryText,
      secondary: primaryBlue,
      onSecondary: Colors.white,
      surface: backgroundBlue,
      onSurface: primaryText,
      onSurfaceVariant: mutedText,
      outline: Color(0xFF6F7785),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: primaryText),
      bodyMedium: TextStyle(fontSize: 14, color: mutedText),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundBlue,
      foregroundColor: primaryText,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryBlue,
      unselectedItemColor: mutedText,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
