import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typograph {
  Typograph();

  static TextStyle HeadlineLarge =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle HeadlineMedium =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400);

  static TextStyle HeadlineSmall =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle TitleLarge =
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle TitleSmall =
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle SubtitleLarge =
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle SubtitleSmall =
      GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle BodyLarge =
      GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle BodyMedium =
      GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.normal);

  static TextStyle BodySmall =
      GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w300);
}
