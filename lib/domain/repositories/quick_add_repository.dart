// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import '../../app/error/failure.dart';

abstract class QuickAddRepository {
  Either<Failure, String> getSpecificQuickAddAmount({required String option});
  Future<Either<Failure, void>> cacheSpecificQuickAddAmount({
    required String option,
    required String value,
  });
}
