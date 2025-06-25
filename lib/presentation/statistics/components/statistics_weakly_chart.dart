// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';

class StatisticsWeaklyChart extends StatelessWidget {
  const StatisticsWeaklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WeeklyData> weeklyData = [
      WeeklyData(day: "Mon", amount: 1800, goal: 2000),
      WeeklyData(day: "Mon", amount: 1800, goal: 2000),
      WeeklyData(day: "Tue", amount: 2200, goal: 2000),
      WeeklyData(day: "Wed", amount: 2250, goal: 2000),
      WeeklyData(day: "Thu", amount: 1800, goal: 2000),
      WeeklyData(day: "Fri", amount: 1900, goal: 2000),
      WeeklyData(day: "Sat", amount: 2100, goal: 2000),
      WeeklyData(day: "Sun", amount: 1200, goal: 2000),
    ];

    return CustomCardWidget(
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: AppDimens.padding12),
          _buildWeeklyChart(context, weeklyData),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart(BuildContext context, List<WeeklyData> weeklyData) {
    return Column(
      children: [
        for (var data in weeklyData)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimens.padding8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    data.day,
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getGreyColorForText(context),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.padding8,
                    ),
                    child: LinearProgressIndicator(
                      value: data.amount / data.goal,
                      minHeight: AppDimens.progressBarHeight,
                      borderRadius: BorderRadius.circular(999),
                      backgroundColor: AppColor.getProgressBarColor(
                        context,
                        isBackground: true,
                      ),
                      color: AppColor.getProgressBarColor(
                        context,
                        isCompleted: data.amount >= data.goal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${data.amount.toStringAsFixed(0)}ml',
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getGreyColorForText(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.calendar,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'This Week',
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ],
    );
  }
}

class WeeklyData {
  final String day;
  final double amount;
  final double goal;

  WeeklyData({required this.day, required this.amount, required this.goal});
}
