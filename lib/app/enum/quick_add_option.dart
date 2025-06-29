enum QuickAddOption { first, second, third }

extension QuickAddOptionExtension on QuickAddOption {
  int get rawValue {
    switch (this) {
      case QuickAddOption.first:
        return 0;
      case QuickAddOption.second:
        return 1;
      case QuickAddOption.third:
        return 2;
    }
  }
}
