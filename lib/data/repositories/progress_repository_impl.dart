// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
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
}
