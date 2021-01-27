import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24;

Color blackColor = Color(0xff000000);
Color greyColor = Color(0xff82868E);
Color purpleColor = Color(0xff5843BE);
Color backgroundColor = Colors.white;

TextStyle blackTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 24, fontWeight: FontWeight.w500, color: blackColor);

TextStyle greyTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: greyColor);

TextStyle purpleTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: purpleColor);

TextStyle whiteTextStyle = GoogleFonts.poppins().copyWith(
    fontSize: 24, fontWeight: FontWeight.w500, color: backgroundColor);
