// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'app/bloc/app_config/app_config_cubit.dart';
import 'app/bloc/app_data/app_data_cubit.dart';
import 'app/di/injector.dart';
import 'app/service/notification_service.dart';
import 'main_app.dart';
import 'presentation/settings/cubit/hydration_calculator_cubit.dart';

enum Flavor { production, staging }

Future<void> bootstrap(Flavor flavor) async {
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
      child: MainApp(flavor: flavor.name),
    ),
  );
}
