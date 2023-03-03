import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const deepOrange = Color(0xFFC75000);
const whiteOrange = Color(0xFFD7743F);
const whiteGrey = Color(0xFFE1E1E1);
const black = Colors.black;
const black87 = Colors.black87;
const darkBg = Color(0xff161E2E);
const formBg = Color(0xFF50577A);
const white = Colors.white;
const whiteBlue = Color(0xFFedf5fa);
var transparentGreen = Colors.green.withOpacity(0.1);
var transparentRed = Colors.red.withOpacity(0.1);
const red = Colors.red;
const green = Colors.green;
const rosaPastel = Color(0xFFccb0ae);
const greenBlue = Color(0xFFafe0d6);
const lightDarkBlue = Color(0xFF79a1b2);

const greyWhite = Color(0xFF8C8C8C);
const blue = Colors.blue;
const whiteRed = Color(0xFFEF5350);
const bgColor = Color(0xFF2e2e2e);
const semiBold = FontWeight.w600;
const bold = FontWeight.bold;
//const kDarkTheme = Color(0xFF212121);

const spacingUnit = 10;

const darkPrimaryColor = Color(0xFF212121);
const darkSecondaryColor = Color(0xFF373737);
const lightPrimaryColor = Color(0xFFFFFFFF);
const lightSecondaryColor = Color(0xFFF3F7FB);
const accentColor = Color(0xFFFFC107);

final titleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(spacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final captionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(spacingUnit.w * 1.3),
  fontWeight: FontWeight.w200,
  color: white,
);

final buttonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(spacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: darkPrimaryColor,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: darkPrimaryColor,
  canvasColor: darkPrimaryColor,
  backgroundColor: darkSecondaryColor,
  accentColor: accentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: lightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: lightSecondaryColor,
        displayColor: lightSecondaryColor,
      ),
);
