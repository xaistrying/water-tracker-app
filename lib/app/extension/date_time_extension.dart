// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get uniqueId => microsecondsSinceEpoch.toString();

  DateTime get startOfWeek {
    final int currentWeekday = weekday;
    final int daysToSubtract = currentWeekday - DateTime.monday;
    return DateTime(year, month, day).subtract(Duration(days: daysToSubtract));
  }

  DateTime get endOfWeek {
    final int currentWeekday = weekday;
    final int daysToAdd = DateTime.sunday - currentWeekday;
    return DateTime(
      year,
      month,
      day,
      23,
      59,
      59,
      999,
    ).add(Duration(days: daysToAdd));
  }

  DateTime get truncate {
    return DateTime(year, month, day);
  }

  int get daysInCurrentMonth {
    return DateTime(year, month + 1, 0).day;
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  String toTimeString() {
    return DateFormat('hh:mm a', 'en_US').format(this);
  }
}
