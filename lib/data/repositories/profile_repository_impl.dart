// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/data/datasources/profile_data_source.dart';
import '../../app/di/injector.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final _dataSource = getIt<ProfileDataSource>();

  @override
  Either<Failure, String> getUserName() {
    try {
      final res = _dataSource.getUserName();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheUserName({
    required String userName,
  }) async {
    try {
      _dataSource.cacheUserName(userName: userName);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool?> getAdvancedModeStatus() {
    try {
      final res = _dataSource.getAdvancedModeStatus();
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheAdvancedModeStatus({
    required bool status,
  }) async {
    try {
      _dataSource.cacheAdvancedModeStatus(status: status);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
