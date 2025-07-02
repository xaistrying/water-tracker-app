extension UniqueIdExtension on DateTime {
  String get uniqueId => microsecondsSinceEpoch.toString();
}
