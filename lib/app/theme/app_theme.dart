// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static TextTheme? textTheme = GoogleFonts.robotoMonoTextTheme();

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(color: Colors.transparent),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(color: Colors.transparent),
  );

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
