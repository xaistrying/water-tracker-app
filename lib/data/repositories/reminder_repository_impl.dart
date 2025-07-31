// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
import '../../app/di/injector.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../datasources/reminder_data_source.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final _dataSource = getIt<ReminderDataSource>();

  @override
  Future<Either<Failure, void>> cacheReminderStatus({
    required bool status,
  }) async {
    try {
      _dataSource.cacheReminderStatus(status: status);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool?> getReminderStatus() {
    try {
      final res = _dataSource.getReminderStatus();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheSoundEffectStatus({
    required bool status,
  }) async {
    try {
      _dataSource.cacheSoundEffectStatus(status: status);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool?> getSoundEffectStatus() {
    try {
      final res = _dataSource.getSoundEffectStatus();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheReminderInterval({
    required double value,
  }) async {
    try {
      _dataSource.cacheReminderInterval(value: value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, double?> getReminderInterval() {
    try {
      final res = _dataSource.getReminderInterval();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheStartTime({
    required String timeString,
  }) async {
    try {
      _dataSource.cacheStartTime(value: timeString);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, String?> getStartTime() {
    try {
      final res = _dataSource.getStartTime();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheEndTime({
    required String timeString,
  }) async {
    try {
      _dataSource.cacheEndTime(value: timeString);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, String?> getEndTime() {
    try {
      final res = _dataSource.getEndTime();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
