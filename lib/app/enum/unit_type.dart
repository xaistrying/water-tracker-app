enum UnitType { milliliters, ounces, kilograms, pounds }

extension UnitTypeExtension on UnitType {
  String get rawValue {
    switch (this) {
      case UnitType.milliliters:
        return 'ml';
      case UnitType.ounces:
        return 'oz';
      case UnitType.kilograms:
        return 'kg';
      case UnitType.pounds:
        return 'lb';
    }
  }

  static UnitType fromRawValue(String raw) {
    switch (raw) {
      case 'ml':
        return UnitType.milliliters;
      case 'oz':
        return UnitType.ounces;
      case 'kg':
        return UnitType.kilograms;
      case 'lb':
        return UnitType.pounds;
      default:
        throw ArgumentError('Unknown unit type: $raw');
    }
  }
}
