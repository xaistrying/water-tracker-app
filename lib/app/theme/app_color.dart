// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';

class AppColor {
  AppColor._();

  static const white = Color.fromARGB(255, 250, 250, 250);
  static const black = Color.fromARGB(255, 10, 10, 10);

  // Light Theme Colors

  static const blue50 = Color(0xFFEFF6FF);
  static const blue100 = Color(0xFFDBEAFE);
  static const blue500 = Color(0xFF3B82F6);
  static const blue600 = Color(0xFF2563EB);
  static const sky50 = Color(0xFFF0F9FF);

  static const gray200 = Color(0xFFE5E7EB);
  static const gray300 = Color(0xFFD1D5DB);
  static const gray500 = Color(0xFF6B7280);
  static const gray700 = Color(0xFF374151);
  static const gray900 = Color(0xFF111827);

  // Dark Theme Colors
  static const slate700 = Color(0xFF334155);
  static const slate800 = Color(0xFF1E293B);
  static const slate900 = Color(0xFF0F172A);
  static const cyan400 = Color(0xFF22D3EE);
  static const slate400 = Color(0xFF94A3B8);

  static Color getWhiteBlack(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
              ? AppColor.black
              : AppColor.white
        : context.isDarkMode
        ? AppColor.white
        : AppColor.black;
  }

  static Color getActiveIconColor(BuildContext context) {
    return context.isDarkMode ? AppColor.cyan400 : AppColor.blue600;
  }

  static LinearGradient getBackgroundColor(BuildContext context) {
    return context.isDarkMode
        ? AppColor.darkBackgroundColor
        : AppColor.backgroundColor;
  }

  static Color getNavBorderColor(BuildContext context) {
    return context.isDarkMode ? AppColor.slate700 : AppColor.gray200;
  }

  static const backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColor.blue50, AppColor.white],
  );

  static const darkBackgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColor.slate900, AppColor.slate800],
  );
}
