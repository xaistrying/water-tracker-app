// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';

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

  String toShortDayOfWeek(BuildContext context) {
    switch (this) {
      case '1':
        return context.loc.mon;
      case '2':
        return context.loc.tue;
      case '3':
        return context.loc.wed;
      case '4':
        return context.loc.thu;
      case '5':
        return context.loc.fri;
      case '6':
        return context.loc.sat;
      case '7':
        return context.loc.sun;
      default:
        throw ArgumentError('Unknown day');
    }
  }

  DateTime? toDateTimeOrNull() {
    return DateFormat('hh:mm a', 'en_US').tryParse(this);
  }
}
