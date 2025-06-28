part of 'app_data_cubit.dart';

@freezed
abstract class AppDataStateData with _$AppDataStateData {
  const factory AppDataStateData({
    @Default(VolumeUnitType.milliliters) VolumeUnitType volumeUnitType,
    @Default(WeightUnitType.kilograms) WeightUnitType weightUnitType,
    @Default('') String userName,
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
}
