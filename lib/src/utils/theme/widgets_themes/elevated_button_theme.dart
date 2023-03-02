import 'package:cidade_segura2/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: tSecondaryColor,
      backgroundColor: tOrangeButtonColor,
      side: const BorderSide(color: tOrangeButtonColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: tSecondaryColor,
      backgroundColor: tOrangeButtonColor,
      side: const BorderSide(color: tOrangeButtonColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}
