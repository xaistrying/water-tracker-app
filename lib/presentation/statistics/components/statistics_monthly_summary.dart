// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/date_time_extension.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class StatisticsMonthlySummary extends StatelessWidget {
  const StatisticsMonthlySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: AppDimens.padding12),
          BlocBuilder<AppDataCubit, AppDataState>(
            builder: (context, state) {
              final monthlyGoalMets = state.data.monthlyGoalMets;
              final percent =
                  monthlyGoalMets / DateTime.now().daysInCurrentMonth * 100;
              return Row(
                spacing: AppDimens.padding16,
                children: [
                  _buildMonthlySummaryItem(
                    context,
                    volume: monthlyGoalMets.toString(),
                    label: context.loc.goals_met,
                  ),
                  _buildMonthlySummaryItem(
                    context,
                    volume: '${percent.toStringAsFixed(0)}%',
                    label: context.loc.success_rate,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlySummaryItem(
    BuildContext context, {
    String label = '',
    String volume = '',
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.padding8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              volume.toString(),
              style: TextStyle(
                fontSize: AppDimens.fontSize20,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: AppColor.getContentColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.time,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.this_month,
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
