// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/double_extension.dart';
import 'package:water_tracker_app/app/theme/app_color.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/constant/image_constant.dart';

class DailyProgressCard extends StatelessWidget {
  const DailyProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Intake number
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                BlocBuilder<AppDataCubit, AppDataState>(
                  builder: (context, state) {
                    final dailyIntake = state.data.dailyIntake;
                    final decimalRange = dailyIntake.isDecimal()
                        ? DataDefault.decimalRange
                        : 0;
                    final unit = state.data.volumeUnitType.rawValue;
                    return Text(
                      '${dailyIntake.toStringAsFixed(decimalRange)}$unit',
                      style: TextStyle(
                        fontSize: AppDimens.fontSize28,
                        color: AppColor.getBlueCyanColor(context),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                BlocBuilder<AppDataCubit, AppDataState>(
                  builder: (context, state) {
                    final dailyGoal = state.data.dailyGoal;
                    final unit = state.data.volumeUnitType.rawValue;
                    return Text(
                      'of ${dailyGoal.toStringAsFixed(0)}$unit daily goal',
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        color: AppColor.getGreyColorForText(context),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Progress bar
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.padding16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
              child: BlocBuilder<AppDataCubit, AppDataState>(
                builder: (context, state) {
                  final dailyIntake = state.data.dailyIntake;
                  final dailyGoal = state.data.dailyGoal;
                  return LinearProgressIndicator(
                    value: dailyIntake / dailyGoal,
                    minHeight: AppDimens.progressBarHeight,
                    backgroundColor: AppColor.gray300,
                    color: AppColor.getBlueCyanColor(context),
                  );
                },
              ),
            ),
          ),

          // Remaining
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageConstant.target,
                colorFilter: ColorFilter.mode(
                  AppColor.getGreyColorForText(context),
                  BlendMode.srcIn,
                ),
                height: AppDimens.iconSize16,
              ),
              const SizedBox(width: AppDimens.padding4),
              BlocBuilder<AppDataCubit, AppDataState>(
                builder: (context, state) {
                  final dailyIntake = state.data.dailyIntake;
                  final dailyGoal = state.data.dailyGoal;
                  final dailyRemaining = dailyGoal - dailyIntake >= 0
                      ? dailyGoal - dailyIntake
                      : 0;
                  final unit = state.data.volumeUnitType.rawValue;
                  return Text(
                    '${dailyRemaining.toStringAsFixed(0)}$unit remaining',
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getGreyColorForText(context),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
