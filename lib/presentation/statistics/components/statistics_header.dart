// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.statistics,
              style: TextStyle(
                fontSize: AppDimens.fontSize20,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
            Text(
              context.loc.statistics_description,
              style: TextStyle(
                fontSize: AppDimens.fontSize16,
                color: AppColor.getContentColor(context),
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          ImageConstant.chart,
          colorFilter: ColorFilter.mode(
            AppColor.getActiveIconColor(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize28,
        ),
      ],
    );
  }
}
