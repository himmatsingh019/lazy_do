import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorData {
  static const Color primaryColor = Color(0xFF26637D);
  static const Color white_color = Colors.white;
  static const Color secondaryColor = Color(0xFF368eb3);
}

ThemeData getMaterialTheme(context) {
  return ThemeData(
    primaryColor: ColorData.primaryColor,
    textTheme:
        GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).copyWith(
      headline6: GoogleFonts.poppins(
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
