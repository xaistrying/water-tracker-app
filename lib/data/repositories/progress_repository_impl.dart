// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/domain/models/daily_intake_model.dart';
import 'package:water_tracker_app/domain/repositories/progress_repository.dart';
import '../../app/di/injector.dart';
import '../datasources/progress_data_source.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final _dataSource = getIt<ProgressDataSource>();

  @override
  Either<Failure, double> getDailyGoal() {
    try {
      final res = _dataSource.getDailyGoal();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheDailyGoal({required double value}) async {
    try {
      _dataSource.cacheDailyGoal(value: value);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, double> getDailyIntake() {
    try {
      final res = _dataSource.getDailyIntake();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheDailyIntake({
    required double value,
  }) async {
    try {
      _dataSource.cacheDailyIntake(value: value);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeDailyIntake() async {
    try {
      _dataSource.removeDailyIntake();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, DateTime> getLastOpenDay() {
    try {
      final res = _dataSource.getLastOpenDay();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheLastOpenDay() async {
    try {
      _dataSource.cacheLastOpenDay();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, List<DailyIntakeModel>> getDailyIntakeHistory() {
    try {
      final res = _dataSource.getDailyIntakeHistory();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheDailyIntakeHistory({
    required DailyIntakeModel data,
  }) async {
    try {
      _dataSource.cacheDailyIntakeHistory(data: data);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeDailyIntakeHistory({
    required int keepDays,
  }) async {
    try {
      _dataSource.removeDailyIntakeHistory(keepDays: keepDays);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, int> getStreakNumber() {
    try {
      final res = _dataSource.getStreakNumber();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheStreakNumber({required int value}) async {
    try {
      _dataSource.cacheStreakNumber(value: value);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeStreakNumber() async {
    try {
      _dataSource.removeStreakNumber();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, List<DailyIntakeModel>> getWeeklyIntake() {
    try {
      final res = _dataSource.getWeeklyIntake();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheWeeklyIntake({
    required DailyIntakeModel data,
  }) async {
    try {
      _dataSource.cacheWeeklyIntake(data: data);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeOldWeeklyIntake() async {
    try {
      _dataSource.removeOldWeeklyIntake();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, int> getMonthlyGoalMets() {
    try {
      final res = _dataSource.getMonthlyGoalMets();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheMonthlyGoalMets({
    required int value,
  }) async {
    try {
      _dataSource.cacheMonthlyGoalMets(value: value);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeMonthlyGoalMets() async {
    try {
      _dataSource.removeMonthlyGoalMets();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool?> getStreakStatus() {
    try {
      final res = _dataSource.getStreakStatus();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheStreakStatus({
    required bool status,
  }) async {
    try {
      _dataSource.cacheStreakStatus(status: status);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeStreakStatus() async {
    try {
      _dataSource.removeStreakStatus();
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
