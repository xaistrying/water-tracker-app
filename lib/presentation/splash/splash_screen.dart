// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(AppRouter.home);
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const CircularProgressIndicator()));
  }
}
