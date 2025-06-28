// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
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
        _buildKeyItem(
          context,
          icon: SvgPicture.asset(
            ImageConstant.trendingUp,
            colorFilter: ColorFilter.mode(
              AppColor.getGreenColor(context),
              BlendMode.srcIn,
            ),
            height: AppDimens.iconSize28,
          ),
          label: 'Day Streak',
          volume: 5,
        ),
        _buildKeyItem(
          context,
          icon: SvgPicture.asset(
            ImageConstant.target,
            colorFilter: ColorFilter.mode(
              AppColor.getActiveIconColor(context),
              BlendMode.srcIn,
            ),
            height: AppDimens.iconSize28,
          ),
          label: 'Weakly Avg (ml)',
          volume: 1886,
        ),
      ],
    );
  }

  Widget _buildKeyItem(
    BuildContext context, {
    String label = '',
    Widget? icon,
    double volume = 0.0,
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
              volume.toStringAsFixed(0),
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
