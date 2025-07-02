// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/domain/models/daily_intake_model.dart';
import '../../app/error/failure.dart';

abstract class ProgressRepository {
  // Daily Goal
  Either<Failure, double> getDailyGoal();
  Future<Either<Failure, void>> cacheDailyGoal({required double value});

  // Daily Intake
  Either<Failure, double> getDailyIntake();
  Future<Either<Failure, void>> cacheDailyIntake({required double value});
  Future<Either<Failure, void>> removeDailyIntake();

  // Last Open Day
  Either<Failure, DateTime> getLastOpenDay();
  Future<Either<Failure, void>> cacheLastOpenDay();

  // Daily Intake History
  Either<Failure, List<DailyIntakeModel>> getDailyIntakeHistory();
  Future<Either<Failure, void>> cacheDailyIntakeHistory({
    required DailyIntakeModel data,
  });
  Future<Either<Failure, void>> removeDailyIntakeHistory({
    required int keepDays,
  });
}
