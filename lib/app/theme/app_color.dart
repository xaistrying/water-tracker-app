// Flutter imports:
import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const white = Color.fromARGB(255, 250, 250, 250);
  static const black = Color.fromARGB(255, 10, 10, 10);

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

  static const backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColor.blue50, AppColor.white],
  );
}
