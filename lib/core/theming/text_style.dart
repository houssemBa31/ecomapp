import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  AppTheme._();


  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.lightBackground,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 14),
    ),
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.Blue,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.darkBackground,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 14),
    ),
  );
}
