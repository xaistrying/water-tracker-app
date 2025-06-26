// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../enum/unit_type.dart';
import '../../l10n/generated/app_localizations.dart';

part 'app_config_state.dart';
part 'app_config_cubit.freezed.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(_InitialState(AppConfigStateData())) {
    _init();
  }

  void _init() {
    updateLocale(AppLocalizations.supportedLocales.first);
  }

  void updateLocale(Locale? locale) {
    emit(UpdateLocaleState(state.data.copyWith(locale: locale)));
  }

  void updateThemeMode(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.light)));
    } else {
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.dark)));
    }
  }

  void updateVolumeUnitType(UnitType unitType) {
    emit(UpdateVolumeUnitType(state.data.copyWith(volumeUnitType: unitType)));
  }

  void updateWeightUnitType(UnitType unitType) {
    emit(UpdateWeightUnitType(state.data.copyWith(weightUnitType: unitType)));
  }
}
