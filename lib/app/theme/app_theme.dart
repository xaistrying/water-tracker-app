// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static TextTheme? textTheme = GoogleFonts.robotoMonoTextTheme();

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.transparent,
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: kBottomNavigationBarHeight,
      backgroundColor: AppColor.white,
    ),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.transparent,
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: kBottomNavigationBarHeight,
      backgroundColor: AppColor.slate800,
    ),
  );

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
