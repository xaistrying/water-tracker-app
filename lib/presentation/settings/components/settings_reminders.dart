// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../widget/feature_item_widget.dart';

class SettingsReminder extends StatelessWidget {
  const SettingsReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        spacing: AppDimens.padding12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeader(context), _buildFeature(context)],
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FeatureItemWidget(
          title: 'Enable Reminders',
          subtitle: 'Get notified to drink water',
          trailing: CupertinoSwitch(
            activeTrackColor: AppColor.getSwitchColor(
              context,
              isTrack: true,
              isActive: true,
            ),
            inactiveTrackColor: AppColor.getSwitchColor(context, isTrack: true),
            thumbColor: AppColor.getSwitchColor(context, isActive: true),
            inactiveThumbColor: AppColor.getSwitchColor(context),
            value: false,
            onChanged: (value) {},
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
          ImageConstant.notification,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Reminders',
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
