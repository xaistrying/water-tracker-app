// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';

class AppColor {
  AppColor._();

  static const white = Color.fromARGB(255, 252, 252, 252);
  static const black = Color.fromARGB(255, 10, 10, 10);

  // Light Theme Colors

  static const blue50 = Color(0xFFEFF6FF);
  static const blue100 = Color(0xFFDBEAFE);
  static const blue200 = Color(0xFFBFDBFE);
  static const blue300 = Color(0xFF93C5FD);
  static const blue500 = Color(0xFF3B82F6);
  static const blue600 = Color(0xFF2563EB);
  static const sky50 = Color(0xFFF0F9FF);
  static const sky100 = Color(0xFFE0F2FE);

  static const gray200 = Color(0xFFE5E7EB);
  static const gray300 = Color(0xFFD1D5DB);
  static const gray500 = Color(0xFF6B7280);
  static const gray600 = Color(0xFF4B5563);
  static const gray700 = Color(0xFF374151);
  static const gray900 = Color(0xFF111827);

  static const green500 = Color(0xFF22C55E);

  // Dark Theme Colors
  static const slate300 = Color(0xFFCBD5E1);
  static const slate400 = Color(0xFF94A3B8);
  static const slate700 = Color(0xFF334155);
  static const slate800 = Color(0xFF1E293B);
  static const slate900 = Color(0xFF0F172A);
  static const cyan400 = Color(0xFF22D3EE);
  static const cyan500 = Color(0xFF06B6D4);
  static const slate600 = Color(0xFF475569);
  static const cyan600 = Color(0xFF0891B2);
  static const teal500 = Color(0xFF14B8A6);
  static const teal600 = Color(0xFF0D9488);
  static const emerald400 = Color(0xFF34D399);

  static Color getWhiteBlack(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
              ? black
              : white
        : context.isDarkMode
        ? white
        : black;
  }

  static Color getActiveIconColor(BuildContext context) {
    return context.isDarkMode ? cyan400 : blue600;
  }

  static LinearGradient getBackgroundColor(BuildContext context) {
    return context.isDarkMode ? darkBackgroundColor : backgroundColor;
  }

  static Color getNavBorderColor(BuildContext context) {
    return context.isDarkMode ? slate700 : blue200;
  }

  static Color getGreyColorForText(BuildContext context) {
    return context.isDarkMode ? slate400 : gray600;
  }

  static Color getCardColor(BuildContext context) {
    return context.isDarkMode
        ? slate800.withValues(alpha: 0.8)
        : white.withValues(alpha: 0.9);
  }

  static LinearGradient getColorfullCardColor(BuildContext context) {
    return context.isDarkMode
        ? LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [cyan600, teal600],
          )
        : const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blue500, blue600],
          );
  }

  static Color getBlueCyanColor(BuildContext context) {
    return context.isDarkMode ? cyan400 : blue500;
  }

  static Color getButtonColor(BuildContext context) {
    return context.isDarkMode ? slate800 : white;
  }

  static LinearGradient getHydrationInsightsCardColor(BuildContext context) {
    return context.isDarkMode
        ? LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              slate800.withValues(alpha: 0.8),
              slate700.withValues(alpha: 0.6),
            ],
          )
        : LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              white.withValues(alpha: 0.8),
              sky50.withValues(alpha: 0.8),
            ],
          );
  }

  static Color getTopRightCircleColor(BuildContext context) {
    return context.isDarkMode
        ? cyan500.withValues(alpha: 0.1)
        : blue500.withValues(alpha: 0.16);
  }

  static Color getBottomLeftCircleColor(BuildContext context) {
    return context.isDarkMode
        ? teal500.withValues(alpha: 0.1)
        : blue500.withValues(alpha: 0.22);
  }

  static Color getContentColor(BuildContext context) {
    return context.isDarkMode ? slate300 : gray700;
  }

  static Color getProgressDotColor(BuildContext context, {bool? isActive}) {
    if (isActive == true) {
      return context.isDarkMode ? cyan400 : blue600;
    } else {
      return context.isDarkMode ? slate600 : blue300;
    }
  }

  static Color getGreenColor(BuildContext context) {
    return context.isDarkMode ? emerald400 : green500;
  }

  static Color getProgressBarColor(
    BuildContext context, {
    bool? isCompleted = false,
    bool? isBackground = false,
  }) {
    if (isBackground == true) {
      return context.isDarkMode ? slate700 : blue200;
    }
    return isCompleted == true
        ? context.isDarkMode
              ? emerald400
              : green500
        : context.isDarkMode
        ? cyan400
        : blue500;
  }

  static Color getTipCardColor(BuildContext context) {
    return context.isDarkMode
        ? slate700.withValues(alpha: 0.6)
        : blue100.withValues(alpha: 0.6);
  }

  static Color getInputFieldColor(BuildContext context) {
    return context.isDarkMode
        ? slate700.withValues(alpha: 0.4)
        : gray200.withValues(alpha: 0.4);
  }

  static Color getTextFieldBorderColor(BuildContext context) {
    return context.isDarkMode ? gray200 : gray600;
  }

  static Color getSelectedSegmentedButtonColor(BuildContext context) {
    return context.isDarkMode ? cyan500 : blue200;
  }

  static Color getSliderTrackColor(BuildContext context) {
    return context.isDarkMode
        ? slate600.withValues(alpha: 0.4)
        : gray300.withValues(alpha: 0.4);
  }

  static Color getSwitchColor(
    BuildContext context, {
    bool? isTrack,
    bool? isActive,
  }) {
    return isTrack == true
        ? isActive == true
              ? getBlueCyanColor(context)
              : context.isDarkMode
              ? slate600
              : gray200
        : isActive == true
        ? context.isDarkMode
              ? white
              : white
        : context.isDarkMode
        ? gray200
        : white;
  }

  static const backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blue100, blue200],
  );

  static const darkBackgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [slate900, slate800],
  );
}
