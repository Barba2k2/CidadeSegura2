import 'package:cidade_segura2/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.bold, color: tDarkColor),
    displayMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, color: tDarkColor),
    displaySmall: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, color: tDarkColor),
    headlineSmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: tDarkColor),
    headlineMedium: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),
    headlineLarge: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.w600, color: tDarkColor),
    titleLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: tDarkColor),
    bodyLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.normal, color: tDarkColor),
    bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.normal, color: tDarkColor),
    labelMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.normal, color: tDarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.bold, color: tWhiteColor),
    displayLarge: GoogleFonts.inter(
        fontSize: 28, fontWeight: FontWeight.bold, color: tWhiteColor),
    displayMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, color: tWhiteColor),
    displaySmall: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w700, color: tWhiteColor),
    headlineMedium: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w600, color: tWhiteColor),
    headlineSmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: tWhiteColor),
    titleLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.normal, color: tWhiteColor),
    bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.normal, color: tWhiteColor),
    labelMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.normal, color: tWhiteColor),
  );
}
