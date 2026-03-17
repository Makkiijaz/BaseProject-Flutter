import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: ColorPalette.white,

    colorScheme: ColorScheme.light(
      primary: ColorPalette.primary,
      onPrimary: ColorPalette.pureWhite,

      secondary: ColorPalette.secondry,
      onSecondary: ColorPalette.pureWhite,

      surface: ColorPalette.pureWhite,
      onSurface: ColorPalette.black,

      error: ColorPalette.error,
      onError: ColorPalette.pureWhite,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.primary,
      foregroundColor: ColorPalette.pureWhite,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorPalette.black),
      bodyMedium: TextStyle(color: ColorPalette.darkGrey),
    ),

    iconTheme: IconThemeData(
      color: ColorPalette.secondry,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.pureWhite,
        minimumSize: const Size.fromHeight(54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.lightGrey,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: ColorPalette.primary,
          width: 1.2,
        ),
      ),

      hintStyle: TextStyle(
        color: ColorPalette.grey,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: ColorPalette.secondry,

    colorScheme: ColorScheme.dark(
      primary: ColorPalette.primary,
      onPrimary: ColorPalette.pureWhite,

      secondary: ColorPalette.white,
      onSecondary: ColorPalette.secondry,

      surface: ColorPalette.secondry,
      onSurface: ColorPalette.white,

      error: ColorPalette.error,
      onError: ColorPalette.pureWhite,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.secondry,
      foregroundColor: ColorPalette.pureWhite,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorPalette.white),
      bodyMedium: TextStyle(color: ColorPalette.grey),
    ),

    iconTheme: IconThemeData(
      color: ColorPalette.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.pureWhite,
        minimumSize: const Size.fromHeight(54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.darkGrey,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: ColorPalette.primary,
          width: 1.2,
        ),
      ),

      hintStyle: TextStyle(
        color: ColorPalette.grey,
      ),
    ),
  );
}