// Dart imports:
import 'dart:convert';

// Project imports:
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';
import '../../domain/models/daily_intake_model.dart';

abstract class ProgressDataSource {
  // Daily Goal
  Future<void> cacheDailyGoal({required double value});
  double? getDailyGoal();

  // Daily Intake
  Future<void> cacheDailyIntake({required double value});
  double? getDailyIntake();
  Future<void> removeDailyIntake();

  // Last Open Day
  Future<void> cacheLastOpenDay();
  DateTime? getLastOpenDay();

  // Daily Intake History
  Future<void> cacheDailyIntakeHistory({required DailyIntakeModel data});
  List<DailyIntakeModel> getDailyIntakeHistory();
  Future<void> removeDailyIntakeHistory();
}

class ProgressDataSourceImpl implements ProgressDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const dailyGoalKey = 'DAILY_GOAL_KEY';
  static const dailyIntakeKey = 'DAILY_INTAKE_KEY';
  static const lastOpenDayKey = 'LAST_OPEN_DAY_KEY';
  static const dailyIntakeHistoryKey = 'DAILY_INTAKE_HISTORY_KEY';

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

  @override
  Future<void> cacheLastOpenDay() async {
    await _pref.setValue<String>(
      lastOpenDayKey,
      DateTime.now().toIso8601String(),
    );
  }

  @override
  DateTime? getLastOpenDay() {
    return DateTime.tryParse(_pref.getValue<String>(lastOpenDayKey) ?? '');
  }

  @override
  Future<void> cacheDailyIntakeHistory({required DailyIntakeModel data}) async {
    String? jsonData = _pref.getValue<String>(dailyIntakeHistoryKey);

    if (jsonData != null && jsonData != '[]') {
      List<DailyIntakeModel> listHistory = DailyIntakeModel.fromList(
        json.decode(jsonData),
      );
      final index = listHistory.indexWhere((e) => e.id == data.id);

      if (index == -1) {
        listHistory.add(data);
      } else {
        listHistory[index] = data;
      }

      await _pref.setValue<String>(
        dailyIntakeHistoryKey,
        json.encode(listHistory.map((e) => e.toJson()).toList()),
      );
    } else {
      List<DailyIntakeModel> listHistory = [data];

      await _pref.setValue<String>(
        dailyIntakeHistoryKey,
        json.encode(listHistory.map((e) => e.toJson()).toList()),
      );
    }
  }

  @override
  List<DailyIntakeModel> getDailyIntakeHistory() {
    final jsonData = _pref.getValue<String>(dailyIntakeHistoryKey);
    List<DailyIntakeModel> listHistory = [];

    if (jsonData != null && jsonData != '[]') {
      listHistory = DailyIntakeModel.fromList(json.decode(jsonData));
    }
    return listHistory;
  }

  @override
  Future<void> removeDailyIntakeHistory() async {
    await _pref.removeValue(dailyIntakeHistoryKey);
  }
}
