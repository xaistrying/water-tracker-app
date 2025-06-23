// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/router/app_router.dart';
import 'app/bloc/app_config/app_config_cubit.dart';
import 'app/l10n/generated/app_localizations.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppConfigCubit())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          themeMode: ThemeMode.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.data.locale,
        );
      },
    );
  }
}
