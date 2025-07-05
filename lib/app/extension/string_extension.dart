extension StringExtension on String {
  String toCapitalized() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return replaceAll(
      RegExp(' +'),
      ' ',
    ).split(' ').map((str) => str.toCapitalized()).join(' ');
  }

  String toShortDayOfWeek() {
    switch (this) {
      case '1':
        return 'Mon';
      case '2':
        return 'Tue';
      case '3':
        return 'Wed';
      case '4':
        return 'Thu';
      case '5':
        return 'Fri';
      case '6':
        return 'Sat';
      case '7':
        return 'Sun';
      default:
        throw ArgumentError('Unknown day');
    }
  }
}
