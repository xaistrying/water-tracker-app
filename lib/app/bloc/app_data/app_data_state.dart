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
}
