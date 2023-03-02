import 'package:cidade_segura2/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TBottomNavigationBarTheme {
  TBottomNavigationBarTheme._();

  static final lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: tSecondaryColor,
    elevation: 0,
    selectedItemColor: tDarkColor,
    unselectedItemColor: tGreyColor,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
    showUnselectedLabels: true,
    selectedIconTheme: const IconThemeData(color: tDarkColor),
  );

  static final darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: tWhiteColor,
    elevation: 0,
    selectedItemColor: tBgLightColor,
    unselectedItemColor: tGreyColor,
    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
    showUnselectedLabels: true,
    selectedIconTheme: const IconThemeData(color: tWhiteColor),
  );
}
