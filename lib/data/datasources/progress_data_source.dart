// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:water_tracker_app/app/enum/retention_period.dart';
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
  Future<void> removeDailyIntakeHistory({required int keepDays});

  // Streak
  Future<void> cacheStreakNumber({required int value});
  int? getStreakNumber();
  Future<void> removeStreakNumber();

  // Weekly Intake
  Future<void> cacheWeeklyIntake({required DailyIntakeModel data});
  List<DailyIntakeModel> getWeeklyIntake();
  Future<void> removeOldWeeklyIntake();
}

class ProgressDataSourceImpl implements ProgressDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const dailyGoalKey = 'DAILY_GOAL_KEY';
  static const dailyIntakeKey = 'DAILY_INTAKE_KEY';
  static const lastOpenDayKey = 'LAST_OPEN_DAY_KEY';
  static const dailyIntakeHistoryKey = 'DAILY_INTAKE_HISTORY_KEY';
  static const streakNumberKey = 'STREAK_NUMBER_KEY';
  static const weeklyIntakeKey = 'WEEKLY_INTAKE_KEY';

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
  Future<void> removeDailyIntakeHistory({required int keepDays}) async {
    if (keepDays == RetentionPeriod.oneDay.numberOfDays) {
      // Remove all history
      await _pref.removeValue(dailyIntakeHistoryKey);
    }

    List<DailyIntakeModel> listHistory = getDailyIntakeHistory();
    if (listHistory.isEmpty) return;

    // Sort by date descending (most recent first)
    listHistory.sort((a, b) {
      final dateA =
          DateTime.tryParse(a.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      final dateB =
          DateTime.tryParse(b.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      return dateB.compareTo(dateA);
    });

    // Keep only the most recent [keepDays] entries
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final cutoff = today.subtract(Duration(days: keepDays - 1));
    final filtered = listHistory.where((entry) {
      final entryDate = DateTime.tryParse(entry.date ?? '');
      if (entryDate == null) return false;
      final entryDateTruncate = DateTime(
        entryDate.year,
        entryDate.month,
        entryDate.day,
      );
      return entryDateTruncate.isAfter(cutoff) ||
          entryDateTruncate.isAtSameMomentAs(cutoff);
    }).toList();

    // Save filtered history
    await _pref.setValue<String>(
      dailyIntakeHistoryKey,
      json.encode(filtered.map((e) => e.toJson()).toList()),
    );
  }

  @override
  Future<void> cacheStreakNumber({required int value}) async {
    await _pref.setValue<int>(streakNumberKey, value);
  }

  @override
  int? getStreakNumber() {
    return _pref.getValue<int>(streakNumberKey);
  }

  @override
  Future<void> removeStreakNumber() async {
    await _pref.removeValue(streakNumberKey);
  }

  @override
  Future<void> cacheWeeklyIntake({required DailyIntakeModel data}) async {
    String? jsonData = _pref.getValue<String>(weeklyIntakeKey);

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
        weeklyIntakeKey,
        json.encode(listHistory.map((e) => e.toJson()).toList()),
      );
    } else {
      List<DailyIntakeModel> listHistory = [data];

      await _pref.setValue<String>(
        weeklyIntakeKey,
        json.encode(listHistory.map((e) => e.toJson()).toList()),
      );
    }
  }

  @override
  List<DailyIntakeModel> getWeeklyIntake() {
    final jsonData = _pref.getValue<String>(weeklyIntakeKey);
    List<DailyIntakeModel> listHistory = [];

    if (jsonData != null && jsonData != '[]') {
      listHistory = DailyIntakeModel.fromList(json.decode(jsonData));
    }
    return listHistory;
  }

  @override
  Future<void> removeOldWeeklyIntake() async {
    List<DailyIntakeModel> listHistory = getWeeklyIntake();
    if (listHistory.isEmpty) return;

    // Sort by date descending (most recent first)
    listHistory.sort((a, b) {
      final dateA =
          DateTime.tryParse(a.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      final dateB =
          DateTime.tryParse(b.date ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0);
      return dateB.compareTo(dateA);
    });

    // Keep only the most recent [keepDays] entries
    final keepDays = 7;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final cutoff = today.subtract(Duration(days: keepDays - 1));
    final filtered = listHistory.where((entry) {
      final entryDate = DateTime.tryParse(entry.date ?? '');
      if (entryDate == null) return false;
      final entryDateTruncate = DateTime(
        entryDate.year,
        entryDate.month,
        entryDate.day,
      );
      return entryDateTruncate.isAfter(cutoff) ||
          entryDateTruncate.isAtSameMomentAs(cutoff);
    }).toList();

    // Save filtered history
    await _pref.setValue<String>(
      weeklyIntakeKey,
      json.encode(filtered.map((e) => e.toJson()).toList()),
    );
  }
}
