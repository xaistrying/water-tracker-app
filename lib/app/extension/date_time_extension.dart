extension DateTimeExtension on DateTime {
  String get uniqueId => microsecondsSinceEpoch.toString();

  DateTime get startOfWeek {
    final int currentWeekday = weekday;
    final int daysToSubtract = currentWeekday - DateTime.monday;
    return DateTime(year, month, day).subtract(Duration(days: daysToSubtract));
  }

  DateTime get truncate {
    return DateTime(year, month, day);
  }
}
