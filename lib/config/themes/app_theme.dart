import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.white,
        height: 1.3,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
