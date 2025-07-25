// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/double_extension.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/constant/data_default.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class StatisticsKey extends StatelessWidget {
  const StatisticsKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimens.padding16,
      children: [
        BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            return _buildKeyItem(
              context,
              icon: SvgPicture.asset(
                ImageConstant.trendingUp,
                colorFilter: ColorFilter.mode(
                  AppColor.getGreenColor(context),
                  BlendMode.srcIn,
                ),
                height: AppDimens.iconSize28,
              ),
              label: context.loc.day_streak,
              volume: state.data.numberOfStreak.toDouble(),
            );
          },
        ),
        BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            final weeklyData = state.data.listWeeklyIntake;
            final avg = context.read<AppDataCubit>().calculateWeeklyAverage(
              weeklyData,
            );
            final unit = state.data.volumeUnitType.rawValue;
            final decimalRange = avg.isDecimal() ? DataDefault.decimalRange : 0;
            return _buildKeyItem(
              context,
              icon: SvgPicture.asset(
                ImageConstant.target,
                colorFilter: ColorFilter.mode(
                  AppColor.getActiveIconColor(context),
                  BlendMode.srcIn,
                ),
                height: AppDimens.iconSize28,
              ),
              label: '${context.loc.weekly_avg} ($unit)',
              volume: avg,
              decimalRange: decimalRange,
            );
          },
        ),
      ],
    );
  }

  Widget _buildKeyItem(
    BuildContext context, {
    String label = '',
    Widget? icon,
    double volume = 0.0,
    int decimalRange = 0,
  }) {
    return Expanded(
      child: CustomCardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(height: 8.0),
            Text(
              volume.toStringAsFixed(decimalRange),
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
}
