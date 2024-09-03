import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFFB7935F);
  static const Color darkprimary = Color(0xFF0F1424);
  static const Color yellowcolor = Color(0xFFFACC1D);

  static const Color blackColor = Color(0xFF242424);
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Color(0xFF242424),
          error: Color(0xFFB7935F),
          onError: Colors.white,
          background: Color(0xFFF8F8F8),
          onBackground: Color(0xFF242424),
          surface: Color(0xFFB7935F),
          onSurface: Color(0xFF141A2E)),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          color: blackColor,
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: GoogleFonts.elMessiri(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primary,
        selectedItemColor: blackColor,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkprimary,
          onPrimary: Colors.white,
          secondary: yellowcolor,
          onSecondary: Color(0xFFF8F8F8),
          error: Color(0xFFFACC1D),
          onError: Colors.white,
          background: Color(0xFF141A2E),
          onBackground: Color(0xFFFACC1D),
          surface: Color(0xFF141A2E),
          onSurface: Color(0xFF141A2E)),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: GoogleFonts.elMessiri(
          color: yellowcolor,
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkprimary,
        selectedItemColor: yellowcolor,
        unselectedItemColor: Colors.white,
      ));
}
