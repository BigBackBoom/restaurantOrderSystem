import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    brightness: Brightness.light,
    cardColor: Colors.white,
    dividerColor: Colors.grey[300],
    primaryColorBrightness: Brightness.light,
    accentColor: CustomColors.accent[500]);

class CustomColors {
  CustomColors._();
  static const _blackPrimaryValue = 0xFF000000;

  static const MaterialColor theme = const MaterialColor(
    _blackPrimaryValue,
    const <int, Color>{
      500: const Color(0xFFFBC812),
      600: const Color(0xFFFEAD22),
    }
  );

  static const Map<int, Color> accent = const <int, Color>{
    500: const Color(0xFFF57C00),
  };
}