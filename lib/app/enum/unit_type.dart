enum VolumeUnitType { milliliters, ounces }

enum WeightUnitType { kilograms, pounds }

extension VolumeUnitTypeExtension on VolumeUnitType {
  String get rawValue {
    switch (this) {
      case VolumeUnitType.milliliters:
        return 'ml';
      case VolumeUnitType.ounces:
        return 'oz';
    }
  }

  static VolumeUnitType fromRawValue(String raw) {
    switch (raw) {
      case 'ml':
        return VolumeUnitType.milliliters;
      case 'oz':
        return VolumeUnitType.ounces;
      default:
        throw ArgumentError('Unknown unit type: $raw');
    }
  }
}

extension WeightUnitTypeExtension on WeightUnitType {
  String get rawValue {
    switch (this) {
      case WeightUnitType.kilograms:
        return 'kg';
      case WeightUnitType.pounds:
        return 'lb';
    }
  }

  static WeightUnitType fromRawValue(String raw) {
    switch (raw) {
      case 'kg':
        return WeightUnitType.kilograms;
      case 'lb':
        return WeightUnitType.pounds;
      default:
        throw ArgumentError('Unknown unit type: $raw');
    }
  }
}
