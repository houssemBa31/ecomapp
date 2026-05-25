import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightWithe,

    colorScheme: ColorScheme.light(
      primary: AppColors.orange,
      secondary: AppColors.black,
      surface: AppColors.lightWithe,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.black),
    ),

    textTheme: const TextTheme(
      labelLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(fontSize: 12),
    ),
  );

  //static ThemeData darkTheme = ThemeData(
  //brightness: Brightness.dark,
  //scaffoldBackgroundColor: AppColors.darkBackground,

  //colorScheme: ColorScheme.dark(
  // primary: AppColors.grey,
  //secondary: AppColors.textPrimaryDark,
  //surface: AppColors.darkBackground,),

  // appBarTheme: AppBarTheme(
  // backgroundColor: AppColors.darkBackground,
  //elevation: 0,
  //iconTheme: const IconThemeData(color: AppColors.white),
  //),

  //textTheme: const TextTheme(
  //displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  //bodyMedium: TextStyle(fontSize: 16),
  //bodySmall: TextStyle(fontSize: 14),
  //),
  //);
}
