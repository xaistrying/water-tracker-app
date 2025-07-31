// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/domain/repositories/units_repository.dart';
import '../../app/di/injector.dart';
import '../datasources/units_data_source.dart';

class UnitsRepositoryImpl implements UnitsRepository {
  final _dataSource = getIt<UnitsDataSource>();

  @override
  Either<Failure, WeightUnitType> getWeightUnitType() {
    try {
      final res = _dataSource.getWeightUnitType();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheWeightUnitType({
    required WeightUnitType weightUnitType,
  }) async {
    try {
      _dataSource.cacheWeightUnitType(weightUnitType: weightUnitType);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, VolumeUnitType> getVolumeUnitType() {
    try {
      final res = _dataSource.getVolumeUnitType();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheVolumeUnitType({
    required VolumeUnitType volumeUnitType,
  }) async {
    try {
      _dataSource.cacheVolumeUnitType(volumeUnitType: volumeUnitType);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
