enum RetentionPeriod { oneDay, oneWeek, oneMonth }

extension RetentionPeriodExtension on RetentionPeriod {
  String get rawValue {
    switch (this) {
      case RetentionPeriod.oneDay:
        return '1 Day';
      case RetentionPeriod.oneWeek:
        return '1 Week';
      case RetentionPeriod.oneMonth:
        return '1 Month';
    }
  }

  static RetentionPeriod fromRawValue(String raw) {
    switch (raw) {
      case '1 Day':
        return RetentionPeriod.oneDay;
      case '1 Week':
        return RetentionPeriod.oneWeek;
      case '1 Month':
        return RetentionPeriod.oneMonth;
      default:
        throw ArgumentError('Unknown type: $raw');
    }
  }
}
