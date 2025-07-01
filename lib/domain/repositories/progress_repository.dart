// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import '../../app/error/failure.dart';

abstract class ProgressRepository {
  // Daily Goal
  Either<Failure, double> getDailyGoal();
  Future<Either<Failure, void>> cacheDailyGoal({required double value});

  // Daily Intake
  Either<Failure, double> getDailyIntake();
  Future<Either<Failure, void>> cacheDailyIntake({required double value});
  Future<Either<Failure, void>> removeDailyIntake();
}
