// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../presentation/splash/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
