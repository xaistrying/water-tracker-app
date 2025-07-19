class UnitConverter {
  static const double _ozToMlFactor = 29.5735296;

  /// Convert ounces to milliliters
  static double ozToMl(double ounces) {
    return (ounces * _ozToMlFactor).ceilToDouble();
  }

  /// Convert milliliters to ounces
  static double mlToOz(double milliliters) {
    return milliliters / _ozToMlFactor;
  }
}
