// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/domain/models/daily_intake_model.dart';
import '../../app/error/failure.dart';

abstract class ProgressRepository {
  // Daily Goal
  Either<Failure, double> getDailyGoal();
  Future<Either<Failure, void>> cacheDailyGoal({required double value});

  // Advanced Mode Status
  Either<Failure, bool?> getAdvancedModeStatus();
  Future<Either<Failure, void>> cacheAdvancedModeStatus({required bool status});

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

  // Streak
  Either<Failure, int> getStreakNumber();
  Future<Either<Failure, void>> cacheStreakNumber({required int value});
  Future<Either<Failure, void>> removeStreakNumber();

  // Weekly Intake
  Either<Failure, List<DailyIntakeModel>> getWeeklyIntake();
  Future<Either<Failure, void>> cacheWeeklyIntake({
    required DailyIntakeModel data,
  });
  Future<Either<Failure, void>> removeOldWeeklyIntake();

  // Monthly Goal Mets
  Either<Failure, int> getMonthlyGoalMets();
  Future<Either<Failure, void>> cacheMonthlyGoalMets({required int value});
  Future<Either<Failure, void>> removeMonthlyGoalMets();

  // Daily Streak Status
  Either<Failure, bool?> getStreakStatus();
  Future<Either<Failure, void>> cacheStreakStatus({required bool status});
  Future<Either<Failure, void>> removeStreakStatus();
}
