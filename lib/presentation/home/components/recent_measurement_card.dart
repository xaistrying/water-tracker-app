// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/router/app_router.dart';

class RecentMeasurementCard extends StatelessWidget {
  const RecentMeasurementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      padding: const EdgeInsets.all(AppDimens.padding16),
      child: Column(
        children: [
          _buildRecentMeasurementHeader(context),
          SizedBox(height: AppDimens.padding12),
          _buildRecentMeasurementItem(
            context,
            time: '10:00 AM',
            volume: '200ml',
          ),
          _buildRecentMeasurementItem(
            context,
            time: '11:30 AM',
            volume: '300ml',
          ),
          _buildRecentMeasurementItem(
            context,
            time: '01:15 PM',
            volume: '250ml',
          ),
        ],
      ),
    );
  }

  Widget _buildRecentMeasurementHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.history,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Recent',
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
        Spacer(),
        TextButton.icon(
          onPressed: () => context.push(AppRouter.recentMore),
          label: Text(
            'More',
            style: TextStyle(color: AppColor.getGreyColorForText(context)),
          ),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.getGreyColorForText(context),
            size: AppDimens.iconSize16,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentMeasurementItem(
    BuildContext context, {
    required String time,
    required String volume,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimens.padding4,
        vertical: 0.0,
      ),
      horizontalTitleGap: AppDimens.padding8,
      leading: Icon(
        Icons.circle,
        size: 8.0,
        color: AppColor.getBlueCyanColor(context),
      ),
      title: Text(
        volume,
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          fontWeight: FontWeight.bold,
          color: AppColor.getWhiteBlack(context),
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          color: AppColor.getGreyColorForText(context),
        ),
      ),
    );
  }
}
