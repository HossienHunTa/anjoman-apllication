import 'package:flutter/material.dart';
import 'colors.dart';

class MyTheme {
  MyTheme._();
  static final theme = ThemeData(
      fontFamily: 'Mitra',
      primaryColor: MyColors.miloOrange,
      scaffoldBackgroundColor: MyColors.willowSky,
      brightness: Brightness.light,
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.sweetOrange,
        disabledColor: MyColors.karBlue,
      ));
  static final darkTheme = ThemeData(
      fontFamily: 'Mitra',
      primaryColor: MyColors.miloOrange,
      scaffoldBackgroundColor: MyColors.stormyBrew,
      brightness: Brightness.dark,
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.darkLightBlue,
        disabledColor: MyColors.karBlue,
      ));
}
