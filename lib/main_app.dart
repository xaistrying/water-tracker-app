// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'app/bloc/app_config/app_config_cubit.dart';
import 'app/l10n/generated/app_localizations.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  final String flavor;

  const MainApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppConfigCubit, AppConfigState>(
      listener: (context, state) {
        if (state is UpdateLocaleState) {
          Intl.defaultLocale = state.data.locale?.languageCode;
        }
      },
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.data.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.data.locale,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQueryData.copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            );
          },
        );
      },
    );
  }
}
