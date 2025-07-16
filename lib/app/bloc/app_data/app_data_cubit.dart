// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/quick_add_option.dart';
import 'package:water_tracker_app/app/enum/retention_period.dart';
import 'package:water_tracker_app/app/extension/date_time_extension.dart';
import 'package:water_tracker_app/app/extension/string_extension.dart';
import 'package:water_tracker_app/domain/models/daily_intake_model.dart';
import 'package:water_tracker_app/domain/repositories/profile_repository.dart';
import 'package:water_tracker_app/domain/repositories/quick_add_repository.dart';
import 'package:water_tracker_app/domain/repositories/reminder_repository.dart';
import 'package:water_tracker_app/domain/repositories/retention_period_repository.dart';
import 'package:water_tracker_app/domain/repositories/units_repository.dart';
import '../../../domain/repositories/progress_repository.dart';
import '../../di/injector.dart';
import '../../enum/unit_type.dart';

part 'app_data_state.dart';
part 'app_data_cubit.freezed.dart';

class AppDataCubit extends Cubit<AppDataState> {
  AppDataCubit() : super(_InitialState(AppDataStateData())) {
    _init();
  }

  final _unitRepo = getIt<UnitsRepository>();
  final _profileRepo = getIt<ProfileRepository>();
  final _quickAddRepo = getIt<QuickAddRepository>();
  final _progressRepo = getIt<ProgressRepository>();
  final _retentionPeriodRepo = getIt<RetentionPeriodRepository>();
  final _reminderRepo = getIt<ReminderRepository>();

  Timer? _midnightTimer;

  void _init() {
    // Check For New Day At Begining
    _checkForNewDay();
    // Check For New Day While App Is On
    _setupMidnightTimer();

    // Weight and Volume Units, Username
    final weightUnitType = _unitRepo.getWeightUnitType().getOrElse(
      (_) => WeightUnitType.kilograms,
    );
    final volumeUnitType = _unitRepo.getVolumeUnitType().getOrElse(
      (_) => VolumeUnitType.milliliters,
    );
    final userName = _profileRepo.getUserName().getOrElse((_) => '');
    updateVolumeUnitType(volumeUnitType);
    updateWeightUnitType(weightUnitType);
    updateUserName(userName);

    // Get All Local Quick Add Amounts, If ALL Null Then Get Default
    final List<String> values = [];
    for (var option in QuickAddOption.values) {
      final value = _quickAddRepo
          .getSpecificQuickAddAmount(option: option.name.toCapitalized())
          .getOrElse((_) => '');
      values.add(value);
    }
    emit(
      UpdateQuickAddValueAll(
        state.data.copyWith(
          quickAddValue1: values[QuickAddOption.first.rawValue].isEmpty
              ? DataDefault.quickAddValue[QuickAddOption.first.rawValue]
              : values[QuickAddOption.first.rawValue],
          quickAddValue2: values[QuickAddOption.second.rawValue].isEmpty
              ? DataDefault.quickAddValue[QuickAddOption.second.rawValue]
              : values[QuickAddOption.second.rawValue],
          quickAddValue3: values[QuickAddOption.third.rawValue].isEmpty
              ? DataDefault.quickAddValue[QuickAddOption.third.rawValue]
              : values[QuickAddOption.third.rawValue],
        ),
      ),
    );

    // Advanced Mode
    final advancedModeStatus = _profileRepo.getAdvancedModeStatus().getOrElse(
      (_) => null,
    );
    updateAdvancedModeStatus(status: advancedModeStatus);

    // Storage
    final retentionPeriod = _retentionPeriodRepo
        .getRetentionPeriodValue()
        .getOrElse((_) => RetentionPeriod.oneDay);
    updateRetentionPeriod(retentionPeriod);

    // Monthly Goal Mets
    final monthlyGoalMets = _progressRepo.getMonthlyGoalMets().getOrElse(
      (_) => 0,
    );
    updateMonthlyGoalMets(monthlyGoalMets);

    // Streak Number and Status
    final streakNumber = _progressRepo.getStreakNumber().getOrElse((_) => 0);
    updateStreakNumber(streakNumber);

    // Progress
    final dailyIntake = _progressRepo.getDailyIntake().getOrElse((_) => 0.0);
    updateDailyIntake(value: dailyIntake, isInitialize: true);

    final intakeHistory = _progressRepo.getDailyIntakeHistory().getOrElse(
      (_) => [],
    );
    updateIntakeHistory(intakeHistory);

    final weeklyIntake = _progressRepo.getWeeklyIntake().getOrElse((_) => []);
    updateWeeklyIntake(weeklyIntake);

    final dailyGoal = _progressRepo.getDailyGoal().getOrElse(
      (_) => DataDefault.dailyGoal,
    );

    if (dailyIntake >= dailyGoal) {
      updateStreakStatus(true);
    }

    updateDailyGoal(value: dailyGoal, isInitialize: true);

    // Reminder
    final reminderStatus = _reminderRepo.getReminderStatus().getOrElse(
      (_) => state.data.reminderStatus,
    );
    updateReminderStatus(reminderStatus);

    final soundEffectStatus = _reminderRepo.getSoundEffectStatus().getOrElse(
      (_) => state.data.soundEffectStatus,
    );
    updateSoundEffectStatus(soundEffectStatus);

    double? reminderInterval = _reminderRepo.getReminderInterval().getOrElse(
      (_) => DataDefault.notificationInterval.toDouble(),
    );
    updateReminderInterval(reminderInterval);

    String? startTime = _reminderRepo.getStartTime().getOrElse((_) => null);
    updateStartTime(startTime);

    String? endTime = _reminderRepo.getEndTime().getOrElse((_) => null);
    updateEndTime(endTime);
  }

  String updateSpecificQuickAddValue({
    required QuickAddOption option,
    required String value,
  }) {
    switch (option) {
      case QuickAddOption.first:
        value = value == "" ? state.data.quickAddValue1 : value;
        emit(UpdateQuickAddValue1(state.data.copyWith(quickAddValue1: value)));
      case QuickAddOption.second:
        value = value == "" ? state.data.quickAddValue2 : value;
        emit(UpdateQuickAddValue2(state.data.copyWith(quickAddValue2: value)));
      case QuickAddOption.third:
        value = value == "" ? state.data.quickAddValue3 : value;
        emit(UpdateQuickAddValue3(state.data.copyWith(quickAddValue3: value)));
    }
    _quickAddRepo.cacheSpecificQuickAddAmount(
      option: option.name.toCapitalized(),
      value: value,
    );
    return value;
  }

  void resetAllQuickAddValue() {
    QuickAddOption.values.asMap().entries.forEach((entry) {
      final index = entry.key;
      final option = entry.value;
      _quickAddRepo.cacheSpecificQuickAddAmount(
        option: option.name.toCapitalized(),
        value: DataDefault.quickAddValue[index],
      );
    });
    emit(
      UpdateQuickAddValueAll(
        state.data.copyWith(
          quickAddValue1: DataDefault.quickAddValue[0],
          quickAddValue2: DataDefault.quickAddValue[1],
          quickAddValue3: DataDefault.quickAddValue[2],
        ),
      ),
    );
  }

  void updateVolumeUnitType(VolumeUnitType volumeUnitType) {
    _unitRepo.cacheVolumeUnitType(volumeUnitType: volumeUnitType);
    emit(
      UpdateVolumeUnitType(state.data.copyWith(volumeUnitType: volumeUnitType)),
    );
  }

  void updateWeightUnitType(WeightUnitType weightUnitType) {
    _unitRepo.cacheWeightUnitType(weightUnitType: weightUnitType);
    emit(
      UpdateWeightUnitType(state.data.copyWith(weightUnitType: weightUnitType)),
    );
  }

  void updateUserName(String userName) {
    _profileRepo.cacheUserName(userName: userName);
    emit(UpdateUserName(state.data.copyWith(userName: userName)));
  }

  void updateDailyGoal({required double value, bool isInitialize = false}) {
    if (isInitialize == false) {
      if (state.data.isAchieveStreakToday) {
        if (state.data.dailyIntake >= state.data.dailyGoal &&
            value > state.data.dailyIntake) {
          final streaks = state.data.numberOfStreak - 1;
          updateStreakNumber(streaks);
          updateStreakStatus(false);

          final monthlyGoalMets = state.data.monthlyGoalMets - 1;
          updateMonthlyGoalMets(monthlyGoalMets);
        }
      } else {
        if (state.data.dailyIntake < state.data.dailyGoal &&
            value <= state.data.dailyIntake) {
          final streaks = state.data.numberOfStreak + 1;
          updateStreakNumber(streaks);
          updateStreakStatus(true);

          final monthlyGoalMets = state.data.monthlyGoalMets + 1;
          updateMonthlyGoalMets(monthlyGoalMets);
        }
      }

      // Update Weely Intake
      final weeklyIntake = [...state.data.listWeeklyIntake];
      var weeklyIntakeItem = DailyIntakeModel(
        id: DateTime.now().truncate.uniqueId,
        goal: value,
      );
      final index = weeklyIntake.indexWhere((e) => e.id == weeklyIntakeItem.id);
      if (index != -1) {
        weeklyIntake[index].goal = value;
        weeklyIntakeItem = weeklyIntake[index];
        updateWeeklyIntake(weeklyIntake);
        _progressRepo.cacheWeeklyIntake(data: weeklyIntakeItem);
      }
    }

    emit(UpdateInProgress(state.data));
    _progressRepo.cacheDailyGoal(value: value);
    emit(UpdateDailyGoal(state.data.copyWith(dailyGoal: value)));
  }

  void updateAdvancedModeStatus({bool? status}) {
    if (status == null) {
      return;
    } else {
      _profileRepo.cacheAdvancedModeStatus(status: status);
      emit(
        UpdateAdvancedModeStatus(
          state.data.copyWith(advancedModeStatus: status),
        ),
      );
    }
  }

  void updateDailyIntake({required double value, bool isInitialize = false}) {
    final currentIntake = state.data.dailyIntake + value;

    // Save to 1 day local storage
    _progressRepo.cacheDailyIntake(value: currentIntake);

    // Save to history local storage
    if (isInitialize == false) {
      final history = [...state.data.listIntakeHistory];
      final historyItem = DailyIntakeModel(
        id: DateTime.now().uniqueId,
        date: DateTime.now().toIso8601String(),
        intake: value,
        goal: state.data.dailyGoal,
      );
      history.add(historyItem);

      _progressRepo.cacheDailyIntakeHistory(data: historyItem);

      // Update Streak
      if (state.data.dailyIntake < state.data.dailyGoal &&
          currentIntake >= state.data.dailyGoal &&
          !state.data.isAchieveStreakToday) {
        final streaks = state.data.numberOfStreak + 1;
        updateStreakNumber(streaks);
        updateStreakStatus(true);

        final monthlyGoalMets = state.data.monthlyGoalMets + 1;
        updateMonthlyGoalMets(monthlyGoalMets);
      }

      // Update Weely Intake
      final weeklyIntake = [...state.data.listWeeklyIntake];
      final weeklyIntakeItem = DailyIntakeModel(
        id: DateTime.now().truncate.uniqueId,
        date: DateTime.now().truncate.toIso8601String(),
        intake: currentIntake,
        goal: state.data.dailyGoal,
      );
      final index = weeklyIntake.indexWhere((e) => e.id == weeklyIntakeItem.id);
      if (index != -1) {
        weeklyIntake[index] = weeklyIntakeItem;
      } else {
        weeklyIntake.add(weeklyIntakeItem);
      }
      updateWeeklyIntake(weeklyIntake);
      _progressRepo.cacheWeeklyIntake(data: weeklyIntakeItem);

      emit(
        UpdateDailyIntake(
          state.data.copyWith(
            dailyIntake: currentIntake,
            listIntakeHistory: history,
          ),
        ),
      );
    } else {
      emit(UpdateDailyIntake(state.data.copyWith(dailyIntake: currentIntake)));
    }
  }

  void updateIntakeHistory(List<DailyIntakeModel> history) {
    emit(UpdateIntakeHistory(state.data.copyWith(listIntakeHistory: history)));
  }

  void resetDailyIntake() {
    emit(UpdateDailyIntake(state.data.copyWith(dailyIntake: 0.0)));
  }

  void _checkForNewDay() {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime lastOpenTime = _progressRepo.getLastOpenDay().getOrElse(
      (_) => DateTime.now(),
    );
    final DateTime lastOpenDay = DateTime(
      lastOpenTime.year,
      lastOpenTime.month,
      lastOpenTime.day,
    );

    // It's a new day! Reset water intake.
    if (today.isAfter(lastOpenDay)) {
      _midnightTask();
    }
  }

  void _setupMidnightTimer() {
    DateTime now = DateTime.now();
    // Calculate the time until the end of the current day (midnight)
    DateTime tomorrow = DateTime(
      now.year,
      now.month,
      now.day,
    ).add(const Duration(days: 1));
    Duration timeUntilMidnight = tomorrow.difference(now);

    // Cancel any existing timer to avoid duplicates
    _midnightTimer?.cancel();

    _midnightTimer = Timer(timeUntilMidnight, () async {
      _midnightTask();

      emit(MidnightState(state.data));

      _setupMidnightTimer();
    });
  }

  void _midnightTask() {
    // Check If Have Not Achieved Streak Today
    final streakStatus = _progressRepo.getStreakStatus().getOrElse(
      (_) => false,
    );
    if (streakStatus == false || streakStatus == null) {
      _progressRepo.removeStreakNumber();
    }
    _progressRepo.removeStreakStatus();

    // Remove Monthly Goal Mets At The End Of Week
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime lastOpenTime = _progressRepo.getLastOpenDay().getOrElse(
      (_) => DateTime.now(),
    );
    final DateTime lastOpenDay = DateTime(
      lastOpenTime.year,
      lastOpenTime.month,
      lastOpenTime.day,
    );
    if (today.month != lastOpenDay.month || today.year != lastOpenDay.year) {
      _progressRepo.removeMonthlyGoalMets();
    }

    // Remove Old Data Pass 7 Days In Weekly Intake
    _progressRepo.removeOldWeeklyIntake();

    // Reset Daily Intake to 0 and Remove Its Local Storage
    _progressRepo.removeDailyIntake();
    resetDailyIntake();

    // Remove Old History Based On Retention Period Settings
    final retentionPeriod = _retentionPeriodRepo
        .getRetentionPeriodValue()
        .getOrElse((_) => RetentionPeriod.oneDay);
    _progressRepo.removeDailyIntakeHistory(
      keepDays: retentionPeriod.numberOfDays,
    );
  }

  void updateRetentionPeriod(RetentionPeriod retentionPeriod) {
    _retentionPeriodRepo.cacheRetentionPeriodValue(
      retentionPeriod: retentionPeriod,
    );
    emit(
      UpdateRetentionPeriod(
        state.data.copyWith(retentionPeriod: retentionPeriod),
      ),
    );
  }

  void updateStreakNumber(int value) {
    _progressRepo.cacheStreakNumber(value: value);
    emit(UpdateStreakNumber(state.data.copyWith(numberOfStreak: value)));
  }

  void updateStreakStatus(bool value) {
    _progressRepo.cacheStreakStatus(status: value);
    emit(UpdateStreakStatus(state.data.copyWith(isAchieveStreakToday: value)));
  }

  void updateWeeklyIntake(List<DailyIntakeModel> data) {
    emit(UpdateWeeklyIntake(state.data.copyWith(listWeeklyIntake: data)));
  }

  double calculateWeeklyAverage(List<DailyIntakeModel> intakeList) {
    final now = DateTime.now();

    final filtered = intakeList.where((item) {
      try {
        final dateStr = item.date;
        if (dateStr == null || dateStr.isEmpty) return false;

        final parsedDate = DateTime.parse(dateStr);
        return !parsedDate.isBefore(now.startOfWeek) &&
            !parsedDate.isAfter(now.endOfWeek);
      } catch (_) {
        return false; // Skip if date is null or invalid format
      }
    }).toList();

    // Sort by parsed date ascending (oldest to newest)
    filtered.sort((a, b) {
      final dateA = DateTime.tryParse(a.date ?? '') ?? DateTime(1970);
      final dateB = DateTime.tryParse(b.date ?? '') ?? DateTime(1970);
      return dateA.compareTo(dateB);
    });

    // Take up to the most recent 7 entries
    final recent = filtered.length >= 7
        ? filtered.sublist(filtered.length - 7)
        : filtered;

    final values = recent.map((e) => e.intake).toList();

    // Pad with 0.0 if fewer than 7 values
    while (values.length < 7) {
      values.insert(0, 0.0);
    }

    final sum = values.fold<double>(0.0, (total, val) => total + (val ?? 0.0));
    return sum / 7;
  }

  void updateMonthlyGoalMets(int value) {
    _progressRepo.cacheMonthlyGoalMets(value: value);
    emit(UpdateMonthlyGoalMets(state.data.copyWith(monthlyGoalMets: value)));
  }

  void beforeClosingTask() {
    // Save Last Open Time
    _progressRepo.cacheLastOpenDay();

    _midnightTimer?.cancel();
  }

  void updateReminderStatus(bool? status) {
    if (status == null) {
      return;
    } else {
      _reminderRepo.cacheReminderStatus(status: status);
      emit(UpdateReminderStatus(state.data.copyWith(reminderStatus: status)));
    }
  }

  void updateSoundEffectStatus(bool? status) {
    if (status == null) {
      return;
    } else {
      _reminderRepo.cacheSoundEffectStatus(status: status);
      emit(
        UpdateSoundEffectStatus(state.data.copyWith(soundEffectStatus: status)),
      );
    }
  }

  void updateReminderInterval(double? value) {
    if (value == null) return;
    _reminderRepo.cacheReminderInterval(value: value);
    emit(UpdateReminderInterval(state.data.copyWith(reminderInterval: value)));
  }

  void updateStartTime(String? value) {
    if (value == null) return;
    _reminderRepo.cacheStartTime(timeString: value);
    emit(UpdateStartTime(state.data.copyWith(startTime: value)));
  }

  void updateEndTime(String? value) {
    if (value == null) return;
    _reminderRepo.cacheEndTime(timeString: value);
    emit(UpdateEndTime(state.data.copyWith(endTime: value)));
  }
}
