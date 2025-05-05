import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';

class ThemeColor {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    brightness: Brightness.light,
    fontFamily: 'OpenSans',
    primaryTextTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkColorSystem,
    brightness: Brightness.dark,
    primaryTextTheme:
        const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    fontFamily: 'OpenSans',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
