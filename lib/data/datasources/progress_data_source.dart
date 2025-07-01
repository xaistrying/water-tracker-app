// Project imports:
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';

abstract class ProgressDataSource {
  // Daily Goal
  Future<void> cacheDailyGoal({required double value});
  double? getDailyGoal();

  // Daily Intake
  Future<void> cacheDailyIntake({required double value});
  double? getDailyIntake();
  Future<void> removeDailyIntake();
}

class ProgressDataSourceImpl implements ProgressDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const dailyGoalKey = 'DAILY_GOAL_KEY';
  static const dailyIntakeKey = 'DAILY_INTAKE_KEY';

  @override
  Future<void> cacheDailyGoal({required double value}) async {
    await _pref.setValue<double>(dailyGoalKey, value);
  }

  @override
  double? getDailyGoal() {
    return _pref.getValue<double>(dailyGoalKey);
  }

  @override
  Future<void> cacheDailyIntake({required double value}) async {
    await _pref.setValue<double>(dailyIntakeKey, value);
  }

  @override
  double? getDailyIntake() {
    return _pref.getValue<double>(dailyIntakeKey);
  }

  @override
  Future<void> removeDailyIntake() async {
    await _pref.removeValue(dailyIntakeKey);
  }
}
