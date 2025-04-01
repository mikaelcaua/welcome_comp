import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';

ThemeData buildTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: tertiaryColor,
      
      );
}
