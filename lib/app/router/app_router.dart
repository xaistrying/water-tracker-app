// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/presentation/settings/components/settings_language_screen.dart';
import '../../presentation/home/components/recent_more_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/nav/nav_screen.dart';
import '../../presentation/settings/settings_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/statistics/statistics_screen.dart';

final _homeScreenKey = GlobalKey<HomeScreenState>();
final _statisticsScreenKey = GlobalKey<StatisticsScreenState>();
final _settingsScreenKey = GlobalKey<SettingsScreenState>();

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String home = '/home';
  static const String statistics = '/statistics';
  static const String settings = '/settings';
  static const String language = '/settings/langauge';
  static const String recentMore = '/settings/home/recent-more';

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavScreen(
          navigationShell: navigationShell,
          homeScreenKey: _homeScreenKey,
          statisticsScreenKey: _statisticsScreenKey,
          settingsScreenKey: _settingsScreenKey,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (context, state) => HomeScreen(key: _homeScreenKey),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: statistics,
                builder: (context, state) =>
                    StatisticsScreen(key: _statisticsScreenKey),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: settings,
                builder: (context, state) =>
                    SettingsScreen(key: _settingsScreenKey),
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
      GoRoute(
        path: language,
        builder: (context, state) {
          return const SettingsLanguageScreen();
        },
      ),
      GoRoute(
        path: recentMore,
        builder: (context, state) {
          return const RecentMoreScreen();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
