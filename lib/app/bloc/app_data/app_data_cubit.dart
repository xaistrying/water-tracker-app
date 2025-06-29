// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/quick_add_option.dart';
import 'package:water_tracker_app/app/extension/string_extension.dart';
import 'package:water_tracker_app/domain/repositories/profile_repository.dart';
import 'package:water_tracker_app/domain/repositories/quick_add_repository.dart';
import 'package:water_tracker_app/domain/repositories/units_repository.dart';
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

  void _init() {
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
        emit(UpdateQuickAddValue1(state.data.copyWith(quickAddValue2: value)));
      case QuickAddOption.third:
        emit(UpdateQuickAddValue1(state.data.copyWith(quickAddValue3: value)));
    }
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
}
