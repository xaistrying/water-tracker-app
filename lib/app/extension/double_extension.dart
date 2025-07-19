extension DoubleExtension on double {
  bool isDecimal() {
    return this % 1 != 0;
  }
}
