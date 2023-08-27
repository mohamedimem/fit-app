import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fw);
}

Color appColorsRed() {
  return Color(0xff900C3F);
}

Color appColorsYellow() {
  return Color(0xffF8DE22);
}

TextStyle appstyleWithHt(
    double size, Color color, FontWeight fw, double height) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fw, height: height);
}
