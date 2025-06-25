// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
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
          Row(
            spacing: AppDimens.padding16,
            children: [
              _buildMonthlySummaryItem(
                context,
                volume: '23',
                label: 'Goals Met',
              ),
              _buildMonthlySummaryItem(
                context,
                volume: '87%',
                label: 'Success Rate',
              ),
            ],
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
          'This Month',
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
