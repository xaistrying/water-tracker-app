// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:water_tracker_app/app/error/failure.dart';
import 'package:water_tracker_app/data/datasources/quick_add_data_source.dart';
import 'package:water_tracker_app/domain/repositories/quick_add_repository.dart';
import '../../app/di/injector.dart';

class QuickAddRepositoryImpl implements QuickAddRepository {
  final _dataSource = getIt<QuickAddDataSource>();

  @override
  Either<Failure, String> getSpecificQuickAddAmount({required String option}) {
    try {
      final res = _dataSource.getSpecificQuickAddValue(option: option);
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheSpecificQuickAddAmount({
    required String option,
    required String value,
  }) async {
    try {
      _dataSource.cacheSpecificQuickAddValue(option: option, value: value);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
