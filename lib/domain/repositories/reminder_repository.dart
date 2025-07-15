// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import '../../app/error/failure.dart';

abstract class ReminderRepository {
  // Reminder Status
  Either<Failure, bool?> getReminderStatus();
  Future<Either<Failure, void>> cacheReminderStatus({required bool status});

  // Sound Effect Status
  Either<Failure, bool?> getSoundEffectStatus();
  Future<Either<Failure, void>> cacheSoundEffectStatus({required bool status});

  // Reminder Interval
  Either<Failure, double?> getReminderInterval();
  Future<Either<Failure, void>> cacheReminderInterval({required double value});

  // Start and End Time of Sleep Hour
  Either<Failure, String?> getStartTime();
  Future<Either<Failure, void>> cacheStartTime({required String timeString});
  Either<Failure, String?> getEndTime();
  Future<Either<Failure, void>> cacheEndTime({required String timeString});
}
