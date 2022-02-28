import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 20.0;

// dominant color
Color primaryColor = Color(0xffd8392b);
Color lightColor = Color(0xffe26c62);
Color darkerColor = Color(0xffaf2c20);
Color whiteColor = Colors.white;

// font color
Color titleColor = Colors.white;
Color titleBlackColor = Colors.black;
Color buttonGrayColor = Color(0xffaaa9b1);
Color grayColor = Color(0xff9c9c9c);
Color genreColor = Color(0xff88A4E8);
Color subTitleColor = Color(0xff110E47);

// icon and logo color
Color starColor = Color(0xffFFC319);
Color idleColor = Color(0XFFBCBCCD);

// background color
Color buttonGrayBgColor = Color(0xffe5e4ea);
Color genreBgColor = Color(0xffDBE3FF);
Color bannerShaderBgColor = Color(0xff110E47);
Color transparentBgColor = Colors.transparent;

// style text
TextStyle splashScreenTextStyle = GoogleFonts.roboto(
  color: titleColor,
  fontSize: 24,
  fontWeight: bold,
);

TextStyle headerTextStyle = GoogleFonts.roboto(
  color: titleBlackColor,
  fontSize: 18,
  fontWeight: medium,
);

TextStyle titleTextStyle = GoogleFonts.roboto(
  color: titleBlackColor,
  fontSize: 16,
  fontWeight: medium,
);

TextStyle buttonTextStyle = GoogleFonts.roboto(
  color: buttonGrayColor,
  fontSize: 10,
  fontWeight: reguler,
);

TextStyle ratingTextStyle = GoogleFonts.roboto(
  color: grayColor,
  fontSize: 12,
  fontWeight: reguler,
);

TextStyle timeTextStyle = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: 12,
  fontWeight: reguler,
);

TextStyle subTextStyle = GoogleFonts.roboto(
  color: grayColor,
  fontSize: 12,
  fontWeight: reguler,
);

// font Weight
FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
