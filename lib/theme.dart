import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoccerColors {
  static final backgroundColor = Color(0xFFE5E5E5);
  static final yellowColor = Color(0xFFFE9402);
  static final blueColor = Color(0xFF152D93);
  static final veryLigthGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final ligthGrey = Color(0xFFBBBBBB);
}

final deliveryGradiant = [SoccerColors.yellowColor, SoccerColors.blueColor];

final _borderLigth = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: SoccerColors.veryLigthGrey, width: 2, style: BorderStyle.solid));

final ligthTheme = ThemeData(
    canvasColor: SoccerColors.white,
    appBarTheme: AppBarTheme(
        color: SoccerColors.white,
        toolbarTextStyle: GoogleFonts.poppinsTextTheme()
            .apply(displayColor: SoccerColors.yellowColor)
            .bodyText2,
        titleTextStyle: GoogleFonts.poppinsTextTheme().headline6!.copyWith(
            fontSize: 20,
            color: SoccerColors.yellowColor,
            fontWeight: FontWeight.bold)),
    bottomAppBarColor: SoccerColors.veryLigthGrey,
    scaffoldBackgroundColor: SoccerColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: SoccerColors.yellowColor,
        displayColor: SoccerColors.yellowColor),
    inputDecorationTheme: InputDecorationTheme(
        border: _borderLigth,
        enabledBorder: _borderLigth,
        focusedBorder: _borderLigth,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: SoccerColors.yellowColor),
        hintStyle:
            GoogleFonts.poppins(color: SoccerColors.ligthGrey, fontSize: 10)),
    iconTheme: IconThemeData(color: SoccerColors.yellowColor),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: SoccerColors.yellowColor));
