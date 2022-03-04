import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/constants.dart';

final kHeading5 = GoogleFonts.poppins(
  color: whiteColor,
  fontWeight: medium,
  fontSize: 20,
);

final kTitle = GoogleFonts.poppins(
  color: whiteColor,
  fontWeight: medium,
  fontSize: 16,
);

final kSubtitle = GoogleFonts.poppins(
  color: greyColor,
  fontWeight: light,
  fontSize: 14,
);

final kBody1 = GoogleFonts.poppins(
  color: greyColor,
  fontWeight: light,
  fontSize: 14,
);

final kBody2 = GoogleFonts.poppins(
  color: greyColor,
  fontWeight: regular,
  fontSize: 12,
);

final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kTitle,
  subtitle1: kSubtitle,
  bodyText1: kBody1,
  bodyText2: kBody2,
);
