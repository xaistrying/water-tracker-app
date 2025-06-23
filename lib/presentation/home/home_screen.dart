// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(),
    );
  }
}
