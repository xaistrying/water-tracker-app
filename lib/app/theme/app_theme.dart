// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'OpenSans',
    scaffoldBackgroundColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: kBottomNavigationBarHeight,
      backgroundColor: AppColor.white,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
    ),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'OpenSans',
    scaffoldBackgroundColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: kBottomNavigationBarHeight,
      backgroundColor: AppColor.slate800,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
    ),
  );

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
