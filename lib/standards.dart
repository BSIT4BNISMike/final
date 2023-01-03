import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Standards {
  // Colors
  static const colors = {
    "primaryColor": Color(0xFFCC90EC),
    "primaryColorLight": Color(0xFFE0B0FF),
    "primaryColorDark": Color(0xFF996EB4),
    "whiteColor": Color(0xFFFFFFFF),
    "blackColor": Color(0xFF000000),
    "grayColor": Color(0xFFE0E0E0),
  };

  // Bounds
  static const bounds = {
    "margin": 20.00,
    "padding": 16.00,
    "borderRadius": 10.00,
    "minimargin": 10.00,
  };

  // Fonts
  static final fontStyles = {
    "main": GoogleFonts.poppins(
      fontSize: 24.00,
      fontWeight: FontWeight.bold,
      color: colors["blackColor"],
    ),
    "mainColored": GoogleFonts.poppins(
      fontSize: 24.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "mainWhite": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "miniWhite": GoogleFonts.poppins(
      fontSize: 20.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "smallerMain": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["blackColor"],
    ),
    "smallerMainColored": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "smallerMainWhite": GoogleFonts.poppins(
      fontSize: 18.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "mainGradient": GoogleFonts.poppins(
      fontSize: 16.00,
      fontWeight: FontWeight.bold,
    ),
    "subtitle": GoogleFonts.poppins(
      fontSize: 15.00,
      color: colors["blackColor"],
    ),
    "mainButtonWhite": GoogleFonts.poppins(
      fontSize: 30.00,
      fontWeight: FontWeight.bold,
      color: colors["whiteColor"],
    ),
    "mainButtonColored": GoogleFonts.poppins(
      fontSize: 30.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColor"],
    ),
    "button": GoogleFonts.poppins(
      fontSize: 14.00,
      fontWeight: FontWeight.bold,
      color: colors["primaryColorDark"],
    ),
    "navigationLabel": GoogleFonts.poppins(
      fontSize: 10.00,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: colors["primaryColorDark"],
    ),
  };
}
