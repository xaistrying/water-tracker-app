// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import '../../app/error/failure.dart';

abstract class ProgressRepository {
  Either<Failure, double> getDailyGoal();
  Future<Either<Failure, void>> cacheDailyGoal({required double value});
}
