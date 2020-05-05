import 'package:flutter/material.dart';


final ThemeData letmeAppTheme = new ThemeData(
    primaryColor: LetmeAppColor.primary[500],
    cardColor: LetmeAppColor.surface,
    backgroundColor: LetmeAppColor.background,
    dividerColor: Colors.grey[300],
    primaryTextTheme: TextTheme(

    ).apply(
        bodyColor: Colors.red,
        displayColor: Colors.blue
    )

);

class LetmeAppColor {
  LetmeAppColor._();

  static const Map<int, Color> primary = const <int, Color>{
    500: const Color(0xFF00D379),
  };

  static const Map<String, Color> onColors = const <String, Color>{
    "primary": const Color(0xDFFFFFFF),
    "background": const Color(0xDF000000),
    "surface": const Color(0xDF000000)
  };

  static const background =  Color(0xFFFFFFFF);

  static const surface =  Color(0xFFFFFFFF);

  static const buttonDisabled =  Color(0xFFBDBDBD);

}