// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../app/theme/app_color.dart';
import '../../app/theme/app_dimens.dart';
import 'components/statistics_header.dart';
import 'components/statistics_key.dart';
import 'components/statistics_monthly_summary.dart';
import 'components/statistics_weekly_chart.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => StatisticsScreenState();
}

class StatisticsScreenState extends State<StatisticsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(AppDimens.padding16),
            children: [
              StatisticsHeader(),
              SizedBox(height: AppDimens.padding16),
              StatisticsKey(),
              SizedBox(height: AppDimens.padding16),
              StatisticsWeeklyChart(),
              SizedBox(height: AppDimens.padding16),
              StatisticsMonthlySummary(),
            ],
          ),
        ),
      ),
    );
  }
}
