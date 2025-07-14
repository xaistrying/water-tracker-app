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

  // Start and End Time of Sleep Hour
}
