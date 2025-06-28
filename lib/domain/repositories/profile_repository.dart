// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import '../../app/error/failure.dart';

abstract class ProfileRepository {
  Either<Failure, String> getUserName();
  Future<Either<Failure, void>> cacheUserName({required String userName});
}
