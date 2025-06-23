// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../presentation/home/home_screen.dart';
import '../../presentation/nav/nav_screen.dart';
import '../../presentation/settings/settings_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/statistics/statistics_screen.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String home = '/home';
  static const String statistics = '/statistics';
  static const String settings = '/settings';

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: statistics,
                builder: (context, state) => const StatisticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
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
