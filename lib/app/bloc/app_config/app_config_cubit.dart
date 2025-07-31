// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:water_tracker_app/app/enum/language_code.dart';
import 'package:water_tracker_app/domain/repositories/config_repository.dart';
import '../../di/injector.dart';
import '../../l10n/generated/app_localizations.dart';

part 'app_config_state.dart';
part 'app_config_cubit.freezed.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(const _InitialState(AppConfigStateData())) {
    _init();
  }

  final _repo = getIt<ConfigRepository>();

  Future<void> _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    updateAppVersion(packageInfo.version);

    final languageCode = _repo.getLanguageCode().getOrElse((_) {
      // Get Device Language Code
      final Locale deviceLocale =
          WidgetsBinding.instance.platformDispatcher.locale;
      String languageCode = deviceLocale.languageCode;

      if (!LanguageCode.values.any((value) => value.name == languageCode)) {
        languageCode = LanguageCode.en.name;
      }

      return languageCode;
    });
    final darkModeStatus = _repo.getDarkModeStatus().getOrElse((_) => null);
    updateLocale(
      AppLocalizations.supportedLocales.firstWhere(
        (locale) => locale.languageCode == languageCode,
      ),
    );
    initThemeMode(darkModeStatus);
  }

  void updateLocale(Locale? locale) {
    _repo.cacheLanguageCode(
      languageCode: locale?.languageCode ?? LanguageCode.en.name,
    );
    emit(UpdateLocaleState(state.data.copyWith(locale: locale)));
  }

  void updateThemeMode(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      _repo.cacheDarkModeStatus(status: false);
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.light)));
    } else {
      _repo.cacheDarkModeStatus(status: true);
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.dark)));
    }
  }

  void initThemeMode(bool? darkModeStatus) {
    if (darkModeStatus == null) {
      return;
    } else if (darkModeStatus) {
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.dark)));
    } else {
      emit(UpdateLocaleState(state.data.copyWith(themeMode: ThemeMode.light)));
    }
  }

  void updateAppVersion(String version) {
    emit(UpdateAppVersion(state.data.copyWith(version: version)));
  }
}
