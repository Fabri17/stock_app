import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class Styles {
  static TextStyle heading1({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 48,
        fontWeight: FontWeight.w800,
      );
  static TextStyle heading2({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 40,
        fontWeight: FontWeight.w800,
      );
  static TextStyle heading3({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );
  static TextStyle heading4({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );
  static TextStyle heading5({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static TextStyle heading6({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  static TextStyle subtitleOne({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle subtitleTwo({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle paragraphOne({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle paragraphTwo({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );

  static TextStyle captionOne({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );
  static TextStyle captionTwo({Color? color}) => GoogleFonts.poppins(
        color: color ?? CustomColors.black,
        fontSize: 8,
        fontWeight: FontWeight.w400,
      );
}
