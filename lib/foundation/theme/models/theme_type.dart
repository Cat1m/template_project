import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppTheme {
  // Gengar's color palette
  static const gengarPurple = Color(0xFF4A3B7C); // Màu tím chủ đạo của Gengar
  static const gengarDarkPurple = Color(0xFF2E1F4D); // Màu tím tối
  static const gengarRed = Color(0xFFDB3F3F); // Màu mắt đỏ của Gengar
  static const gengarShadow = Color(0xFF1A1625); // Màu bóng tối

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: gengarPurple,
      brightness: Brightness.light,
      primary: gengarPurple,
      secondary: gengarRed,
      tertiary: gengarDarkPurple,
      surface: Colors.white,
      // ignore: deprecated_member_use
      background: Color(0xFFF5F3F7), // Màu nền nhạt
      error: gengarRed,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: gengarPurple,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      margin: EdgeInsets.all(8),
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: gengarPurple,
      foregroundColor: Colors.white,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: gengarPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: gengarPurple,
      brightness: Brightness.dark,
      primary: gengarPurple,
      secondary: gengarRed,
      tertiary: gengarDarkPurple,
      surface: gengarShadow,
      // ignore: deprecated_member_use
      background: Colors.black,
      error: gengarRed,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: gengarShadow,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      margin: EdgeInsets.all(8),
      color: gengarShadow,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: gengarPurple,
      foregroundColor: Colors.white,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: gengarPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
