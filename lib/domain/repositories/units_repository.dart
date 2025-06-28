// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/enum/unit_type.dart';
import '../../app/error/failure.dart';

abstract class UnitsRepository {
  Either<Failure, WeightUnitType> getWeightUnitType();
  Future<Either<Failure, void>> cacheWeightUnitType({
    required WeightUnitType weightUnitType,
  });
  Either<Failure, VolumeUnitType> getVolumeUnitType();
  Future<Either<Failure, void>> cacheVolumeUnitType({
    required VolumeUnitType volumeUnitType,
  });
}
