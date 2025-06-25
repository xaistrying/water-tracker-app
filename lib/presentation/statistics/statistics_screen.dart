// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../app/theme/app_color.dart';
import '../../app/theme/app_dimens.dart';
import 'components/statistics_header.dart';
import 'components/statistics_key.dart';
import 'components/statistics_monthly_summary.dart';
import 'components/statistics_weakly_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(AppDimens.padding16),
          children: [
            StatisticsHeader(),
            SizedBox(height: AppDimens.padding16),
            StatisticsKey(),
            SizedBox(height: AppDimens.padding16),
            StatisticsWeaklyChart(),
            SizedBox(height: AppDimens.padding16),
            StatisticsMonthlySummary(),
          ],
        ),
      ),
    );
  }
}
