import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:starwars/core/presentation/styles/colors.dart';

class Styles {
  static TextStyle titleStyle() {
    return GoogleFonts.bebasNeue(
        color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24.sp);
  }

  static TextStyle cardTitleStyle() {
    return GoogleFonts.bebasNeue(
        color: greenFlourescentColor,
        fontWeight: FontWeight.w300,
        fontSize: 16.sp);
  }

  static TextStyle cardTagStyle() {
    return GoogleFonts.bebasNeue(
        color: greenFlourescentColor,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp);
  }

  static TextStyle cardTextStyle() {
    return GoogleFonts.bebasNeue(
        color: greenFlourescentColor,
        fontWeight: FontWeight.w300,
        fontSize: 12.sp);
  }
}
