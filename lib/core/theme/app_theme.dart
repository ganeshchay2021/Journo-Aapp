import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurney_blog_app/core/constant/my_colors.dart';

class AppTheme {
  static final lightMode = ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static final darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondaryColor),
    useMaterial3: true,
  );
}
