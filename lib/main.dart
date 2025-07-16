// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/router/app_router.dart';
import 'package:water_tracker_app/presentation/settings/cubit/hydration_calculator_cubit.dart';
import 'app/bloc/app_config/app_config_cubit.dart';
import 'app/bloc/app_data/app_data_cubit.dart';
import 'app/di/injector.dart';
import 'app/l10n/generated/app_localizations.dart';
import 'app/service/notification_service.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await NotificationService().initNotification();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppConfigCubit()),
        BlocProvider(create: (context) => AppDataCubit()),
        BlocProvider(create: (context) => HydrationCalculatorCubit()),
      ],
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
          themeMode: state.data.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.data.locale,
        );
      },
    );
  }
}
