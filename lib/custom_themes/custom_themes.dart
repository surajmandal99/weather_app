import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/consts/colors.dart';

class CustomThemes {
  //LIGHT THEME
  static final lightTheme = ThemeData(
      cardColor: Colors.white,
      fontFamily: "poppins",
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Vx.gray600,
      iconTheme: const IconThemeData(
        color: Vx.gray600,
      ));

//DARK THEME
  static final darkTheme = ThemeData(
      cardColor: bgColor,
      fontFamily: "poppins",
      scaffoldBackgroundColor: bgColor,
      primaryColor: Vx.white,
      iconTheme: const IconThemeData(color: Vx.white));
}
