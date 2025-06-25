// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
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
                Text(
                  '1200ml',
                  style: TextStyle(
                    fontSize: AppDimens.fontSize28,
                    color: AppColor.getBlueCyanColor(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'of 2000ml daily goal',
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeDefault,
                    color: AppColor.getGreyColorForText(context),
                  ),
                ),
              ],
            ),
          ),

          // Progress bar
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.padding16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
              child: LinearProgressIndicator(
                value: 1200 / 2000,
                minHeight: AppDimens.progressBarHeight,
                backgroundColor: Colors.grey[300],
                color: AppColor.getBlueCyanColor(context),
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
              const SizedBox(width: 4),
              Text(
                '800ml remaining',
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  color: AppColor.getGreyColorForText(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
