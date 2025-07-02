// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/enum/retention_period.dart';
import '../../app/error/failure.dart';

abstract class RetentionPeriodRepository {
  Either<Failure, RetentionPeriod> getRetentionPeriodValue();
  Future<Either<Failure, void>> cacheRetentionPeriodValue({
    required RetentionPeriod retentionPeriod,
  });
}
