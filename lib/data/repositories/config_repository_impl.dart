// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/data/datasources/config_data_source.dart';
import 'package:water_tracker_app/domain/repositories/config_repository.dart';
import '../../app/di/injector.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final _dataSource = getIt<ConfigDataSource>();

  @override
  Either<Failure, String> getLanguageCode() {
    try {
      final res = _dataSource.getLanguageCode();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheLanguageCode({
    required String languageCode,
  }) async {
    try {
      _dataSource.cacheLanguageCode(languageCode: languageCode);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, bool?> getDarkModeStatus() {
    try {
      final res = _dataSource.getDarkModeStatus();
      if (res == null) {
        return Left(Failure(message: 'Value is none'));
      }
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheDarkModeStatus({
    required bool status,
  }) async {
    try {
      _dataSource.cacheDarkModeStatus(status: status);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
