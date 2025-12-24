import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);

  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    ThemeData themeData;
    if (brightness == Brightness.dark) {
      themeData = ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
      );
    } else {
      themeData = ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
      );
    }

    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(fontFamily: GoogleFonts.poppins().fontFamily),
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      dividerTheme: const DividerThemeData(space: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
