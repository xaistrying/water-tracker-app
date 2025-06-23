// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../app/theme/app_color.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(),
    );
  }
}
