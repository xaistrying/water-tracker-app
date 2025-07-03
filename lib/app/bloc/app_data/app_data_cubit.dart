// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/quick_add_option.dart';
import 'package:water_tracker_app/app/enum/retention_period.dart';
import 'package:water_tracker_app/app/extension/string_extension.dart';
import 'package:water_tracker_app/app/extension/unique_id_extension.dart';
import 'package:water_tracker_app/domain/models/daily_intake_model.dart';
import 'package:water_tracker_app/domain/repositories/profile_repository.dart';
import 'package:water_tracker_app/domain/repositories/quick_add_repository.dart';
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

  Timer? _midnightTimer;

  void _init() {
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

    // Progress
    final dailyGoal = _progressRepo.getDailyGoal().getOrElse(
      (_) => DataDefault.dailyGoal,
    );
    updateDailyGoal(dailyGoal);
    final dailyIntake = _progressRepo.getDailyIntake().getOrElse((_) => 0.0);
    updateDailyIntake(value: dailyIntake, isInitialize: true);
    // Check For New Day At Begining
    _checkForNewDay();
    // Check For New Day While App Is On
    _setupMidnightTimer();

    final intakeHistory = _progressRepo.getDailyIntakeHistory().getOrElse(
      (_) => [],
    );
    updateIntakeHistory(intakeHistory);

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
  }

  void updateSpecificQuickAddValue({
    required QuickAddOption option,
    required String value,
  }) {
    _quickAddRepo.cacheSpecificQuickAddAmount(
      option: option.name.toCapitalized(),
      value: value,
    );
    switch (option) {
      case QuickAddOption.first:
        emit(UpdateQuickAddValue1(state.data.copyWith(quickAddValue1: value)));
      case QuickAddOption.second:
        emit(UpdateQuickAddValue2(state.data.copyWith(quickAddValue2: value)));
      case QuickAddOption.third:
        emit(UpdateQuickAddValue3(state.data.copyWith(quickAddValue3: value)));
    }
  }

  void resetAllQuickAddValue() {
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

  void updateDailyGoal(double value) {
    emit(UpdateInProgress(state.data));
    _progressRepo.cacheDailyGoal(value: value);
    emit(UpdateDailyGoal(state.data.copyWith(dailyGoal: value)));
  }

  void updateAdvancedModeStatus({bool? status}) {
    if (status == null) {
      _profileRepo.cacheAdvancedModeStatus(
        status: state.data.advancedModeStatus,
      );
    }
    emit(
      UpdateAdvancedModeStatus(
        state.data.copyWith(
          advancedModeStatus: status ?? !state.data.advancedModeStatus,
        ),
      ),
    );
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
      emit(
        UpdateDailyIntake(
          state.data.copyWith(
            dailyIntake: currentIntake,
            listIntakeHistory: history,
          ),
        ),
      );
      return;
    }

    emit(UpdateDailyIntake(state.data.copyWith(dailyIntake: currentIntake)));
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
      _progressRepo.removeDailyIntake();
      _progressRepo.removeDailyIntakeHistory(
        keepDays: state.data.retentionPeriod.numberOfDays,
      );
      resetDailyIntake();
    }
    emit(MidnightState(state.data));
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
      // Reset Daily Intake To 0.0
      _progressRepo.removeDailyIntake();
      resetDailyIntake();

      // Clear History
      _progressRepo.removeDailyIntakeHistory(
        keepDays: state.data.retentionPeriod.numberOfDays,
      );

      emit(MidnightState(state.data));

      _setupMidnightTimer();
    });
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

  @override
  Future<void> close() {
    // Save Last Open Time
    _progressRepo.cacheLastOpenDay();

    _midnightTimer?.cancel();

    return super.close();
  }
}
