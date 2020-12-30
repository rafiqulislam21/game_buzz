import 'package:flutter/material.dart';

class Themes {
  static Color lightPrimary = Color(0xffB58459);

  static Color darkPrimary = Color(0xffB58459);

  static Color lightAccent = Color(0x66000000);
  static Color darkAccent = Colors.grey[400];

  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff15181D);

  static Color lightBG2 = Colors.grey[300];
  static Color lightBG3 = Color(0xfffcfcff);

  static Color darkBG2 = Color(0xff272629);
  // static Color darkBG2 = Color(0xff1E1E1E);
  static Color darkBG3 = Color(0xff333333);

  static Color buttonLight = Color(0xff7972B5);
  static Color buttonDark = Color(0xff7972B5);

  static Color appbarLight = Color(0xffB58459);
  static Color appbarDark = Color(0xff3C3A3F);

  static var darkShadow = const <BoxShadow>[
    BoxShadow(
      color: const Color(0x66000000),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];
  static var lightShadow = const <BoxShadow>[
    BoxShadow(
      color: const Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static final light = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: appbarLight
      ),
      backgroundColor: lightBG,
      primaryColor: lightPrimary,
      accentColor: lightAccent,
      cursorColor: lightAccent,
      scaffoldBackgroundColor: lightBG,
      buttonColor: buttonLight,
      bottomAppBarColor: lightBG,
      bottomAppBarTheme: BottomAppBarTheme(color: lightBG),
      cardColor: lightBG2,
      dialogBackgroundColor: lightBG2,
      canvasColor: lightBG2,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightBG2,
      ));


  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: appbarDark
    ),
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    buttonColor: buttonDark,
    bottomAppBarColor: darkBG,
    bottomAppBarTheme: BottomAppBarTheme(color: darkBG),
    cardColor: darkBG2,
    dialogBackgroundColor: darkBG2,
    canvasColor: darkBG2,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkBG2,
    ),
  );
}
