// Project imports:
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';

abstract class ProgressDataSource {
  Future<void> cacheDailyGoal({required double value});
  double? getDailyGoal();
}

class ProgressDataSourceImpl implements ProgressDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const dailyGoalKey = 'DAILY_GOAL_KEY';

  @override
  Future<void> cacheDailyGoal({required double value}) async {
    await _pref.setValue<double>(dailyGoalKey, value);
  }

  @override
  double? getDailyGoal() {
    return _pref.getValue<double>(dailyGoalKey);
  }
}
