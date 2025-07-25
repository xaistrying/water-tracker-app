// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/router/app_router.dart';
import '../../app/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
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
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: AppColor.getBlueCyanColor(context),
          ),
        ),
      ),
    );
  }
}
