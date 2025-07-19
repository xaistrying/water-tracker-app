// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/date_time_extension.dart';
import 'package:water_tracker_app/app/extension/double_extension.dart';
import 'package:water_tracker_app/app/extension/string_extension.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../../../domain/models/daily_intake_model.dart';

class StatisticsWeeklyChart extends StatelessWidget {
  const StatisticsWeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: AppDimens.padding12),
          _buildWeeklyChart(context),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart(BuildContext context) {
    return BlocBuilder<AppDataCubit, AppDataState>(
      builder: (context, state) {
        final weeklyData = state.data.listWeeklyIntake;
        return Column(
          children: List.generate(DateTime.daysPerWeek, (index) {
            final date = DateTime.now().startOfWeek.add(Duration(days: index));
            final item = weeklyData.firstWhere(
              (e) => e.id == date.uniqueId,
              orElse: () => DailyIntakeModel(),
            );
            final amount = item.intake ?? 0.0;
            final goal = item.goal ?? DataDefault.dailyGoal;
            final unit = state.data.volumeUnitType.rawValue;
            final decimalRange = amount.isDecimal()
                ? DataDefault.decimalRange
                : 0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.padding8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 36,
                    child: Text(
                      (index + 1).toString().toShortDayOfWeek(),
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
                        value: amount / goal,
                        minHeight: AppDimens.progressBarHeight,
                        borderRadius: BorderRadius.circular(999),
                        backgroundColor: AppColor.getProgressBarColor(
                          context,
                          isBackground: true,
                        ),
                        color: AppColor.getProgressBarColor(
                          context,
                          isCompleted: amount >= goal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 56,
                    child: Text(
                      '${amount.toStringAsFixed(decimalRange)}$unit',
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        color: AppColor.getGreyColorForText(context),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
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
