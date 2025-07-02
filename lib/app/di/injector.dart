// Package imports:
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:water_tracker_app/data/datasources/config_data_source.dart';
import 'package:water_tracker_app/data/datasources/profile_data_source.dart';
import 'package:water_tracker_app/data/datasources/quick_add_data_source.dart';
import 'package:water_tracker_app/data/datasources/retention_period_data_source.dart';
import 'package:water_tracker_app/data/datasources/units_data_source.dart';
import 'package:water_tracker_app/data/repositories/units_repository_impl.dart';
import 'package:water_tracker_app/domain/repositories/config_repository.dart';
import 'package:water_tracker_app/domain/repositories/profile_repository.dart';
import 'package:water_tracker_app/domain/repositories/quick_add_repository.dart';
import 'package:water_tracker_app/domain/repositories/units_repository.dart';
import '../../data/datasources/progress_data_source.dart';
import '../../data/repositories/config_repository_impl.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/repositories/progress_repository_impl.dart';
import '../../data/repositories/quick_add_repository_impl.dart';
import '../../data/repositories/retention_repository_impl.dart';
import '../../domain/repositories/progress_repository.dart';
import '../../domain/repositories/retention_period_repository.dart';
import '../service/app_prefs_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Service //
  getIt.registerSingleton<AppPrefsServiceHelper>(AppPrefsServiceHelper());

  // Data Source //
  getIt.registerLazySingleton<UnitsDataSource>(() => UnitsDataSourceImpl());
  getIt.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl());
  getIt.registerLazySingleton<ConfigDataSource>(() => ConfigDataSourceImpl());
  getIt.registerLazySingleton<QuickAddDataSource>(
    () => QuickAddDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProgressDataSource>(
    () => ProgressDataSourceImpl(),
  );
  getIt.registerLazySingleton<RetentionPeriodDataSource>(
    () => RetentionPeriodDataSourceImpl(),
  );

  // Repository //
  getIt.registerLazySingleton<UnitsRepository>(() => UnitsRepositoryImpl());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  getIt.registerLazySingleton<ConfigRepository>(() => ConfigRepositoryImpl());
  getIt.registerLazySingleton<QuickAddRepository>(
    () => QuickAddRepositoryImpl(),
  );
  getIt.registerLazySingleton<ProgressRepository>(
    () => ProgressRepositoryImpl(),
  );
  getIt.registerLazySingleton<RetentionPeriodRepository>(
    () => RetentionPeriodRepositoryImpl(),
  );
}
