part of 'app_data_cubit.dart';

@freezed
abstract class AppDataStateData with _$AppDataStateData {
  const factory AppDataStateData({
    @Default(VolumeUnitType.milliliters) VolumeUnitType volumeUnitType,
    @Default(WeightUnitType.kilograms) WeightUnitType weightUnitType,
    @Default('') String userName,
    @Default('') String quickAddValue1,
    @Default('') String quickAddValue2,
    @Default('') String quickAddValue3,
    @Default(0.0) double dailyGoal,
    @Default(false) bool advancedModeStatus,
    @Default(0.0) double dailyIntake,
    @Default([]) List<DailyIntakeModel> listIntakeHistory,
    @Default(RetentionPeriod.oneDay) RetentionPeriod retentionPeriod,
    @Default(false) bool isAchieveStreakToday,
    @Default(0) int numberOfStreak,
    @Default([]) List<DailyIntakeModel> listWeeklyIntake,
    @Default(0) int monthlyGoalMets,
    @Default(true) bool reminderStatus,
    @Default(true) bool soundEffectStatus,
    double? reminderInterval,
    String? startTime,
    String? endTime,
    @Default(false) bool isInitComplete,
  }) = _AppDataStateData;
}

@freezed
abstract class AppDataState with _$AppDataState {
  const factory AppDataState.initialState(AppDataStateData data) =
      _InitialState;
  const factory AppDataState.updateVolumeUnitType(AppDataStateData data) =
      UpdateVolumeUnitType;
  const factory AppDataState.updateWeightUnitType(AppDataStateData data) =
      UpdateWeightUnitType;
  const factory AppDataState.updateUserName(AppDataStateData data) =
      UpdateUserName;
  const factory AppDataState.updateQuickAddValue1(AppDataStateData data) =
      UpdateQuickAddValue1;
  const factory AppDataState.updateQuickAddValue2(AppDataStateData data) =
      UpdateQuickAddValue2;
  const factory AppDataState.updateQuickAddValue3(AppDataStateData data) =
      UpdateQuickAddValue3;
  const factory AppDataState.updateQuickAddValueAll(AppDataStateData data) =
      UpdateQuickAddValueAll;
  const factory AppDataState.updateDailyGoal(AppDataStateData data) =
      UpdateDailyGoal;
  const factory AppDataState.updateInProgress(AppDataStateData data) =
      UpdateInProgress;
  const factory AppDataState.updateAdvancedModeStatus(AppDataStateData data) =
      UpdateAdvancedModeStatus;
  const factory AppDataState.updateDailyIntake(AppDataStateData data) =
      UpdateDailyIntake;
  const factory AppDataState.updateIntakeHistory(AppDataStateData data) =
      UpdateIntakeHistory;
  const factory AppDataState.updateRetentionPeriod(AppDataStateData data) =
      UpdateRetentionPeriod;
  const factory AppDataState.midnightState(AppDataStateData data) =
      MidnightState;
  const factory AppDataState.updateStreakStatus(AppDataStateData data) =
      UpdateStreakStatus;
  const factory AppDataState.updateStreakNumber(AppDataStateData data) =
      UpdateStreakNumber;
  const factory AppDataState.updateWeeklyIntake(AppDataStateData data) =
      UpdateWeeklyIntake;
  const factory AppDataState.updateMonthlyGoalMets(AppDataStateData data) =
      UpdateMonthlyGoalMets;
  const factory AppDataState.updateReminderStatus(AppDataStateData data) =
      UpdateReminderStatus;
  const factory AppDataState.updateSoundEffectStatus(AppDataStateData data) =
      UpdateSoundEffectStatus;
  const factory AppDataState.updateReminderInterval(AppDataStateData data) =
      UpdateReminderInterval;
  const factory AppDataState.updateStartTime(AppDataStateData data) =
      UpdateStartTime;
  const factory AppDataState.updateEndTime(AppDataStateData data) =
      UpdateEndTime;
}
