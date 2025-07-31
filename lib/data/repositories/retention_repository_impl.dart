// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/enum/retention_period.dart';
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/data/datasources/retention_period_data_source.dart';
import '../../app/di/injector.dart';
import '../../domain/repositories/retention_period_repository.dart';

class RetentionPeriodRepositoryImpl implements RetentionPeriodRepository {
  final _dataSource = getIt<RetentionPeriodDataSource>();

  @override
  Either<Failure, RetentionPeriod> getRetentionPeriodValue() {
    try {
      final res = _dataSource.getRetentionPeriodValue();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheRetentionPeriodValue({
    required RetentionPeriod retentionPeriod,
  }) async {
    try {
      _dataSource.cacheRetentionPeriodValue(retentionPeriod: retentionPeriod);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
