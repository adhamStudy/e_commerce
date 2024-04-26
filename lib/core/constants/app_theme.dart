import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColor),
  appBarTheme: AppBarTheme(color: AppColors.primaryColor),
  textTheme: GoogleFonts.ubuntuTextTheme().copyWith(
    displayLarge: GoogleFonts.roboto(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.grey,
    ),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: GoogleFonts.cairo().fontFamily,
  textTheme: GoogleFonts.cairoTextTheme().copyWith(
    displayLarge: GoogleFonts.cairo(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    bodyLarge: GoogleFonts.cairo(
      fontSize: 16,
      color: AppColors.grey,
    ),
  ),
);
