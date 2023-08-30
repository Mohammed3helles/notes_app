import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/color_manager.dart';
import 'package:notes_app/presentation/resources/font_manager.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        useMaterial3: false,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: ColorManager.white,
              fontSize: FontSize.f28,
              fontWeight: FontWeight.w600),
          titleMedium: TextStyle(
              color: ColorManager.black,
              fontSize: FontSize.f24,
              fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              color: ColorManager.black.withOpacity(0.4),
              fontSize: FontSize.f18,
              fontWeight: FontWeight.w300),
          titleSmall: TextStyle(
              color: ColorManager.black.withOpacity(0.4),
              fontSize: FontSize.f14,
              fontWeight: FontWeight.w300),
        ));
  }
}
