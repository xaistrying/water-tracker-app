// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../widget/feature_item_widget.dart';
import '../widget/slider_widget.dart';
import '../widget/time_picker_field.dart';

class SettingsReminder extends StatefulWidget {
  const SettingsReminder({super.key});

  @override
  State<SettingsReminder> createState() => _SettingsReminderState();
}

class _SettingsReminderState extends State<SettingsReminder> {
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  void dispose() {
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

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
      spacing: AppDimens.padding12,
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
        FeatureItemWidget(
          title: 'Sound Effects',
          subtitle: 'Play sound for actions',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reminder Interval',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
            SliderWidget(
              max: 180,
              min: 15,
              unit: 'min',
              divisions: 11,
              onChangeEnd: (newValue) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.padding4),
              child: Text(
                'Sleep Hours',
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ),
            Text(
              'Reminders will be paused during these hours',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: AppColor.getContentColor(context),
              ),
            ),
            SizedBox(height: AppDimens.padding12),
            Row(
              spacing: AppDimens.padding4,
              children: [
                Expanded(
                  child: TimePickerField(controller: startTimeController),
                ),
                Icon(Icons.arrow_forward_rounded, size: AppDimens.iconSize20),
                Expanded(child: TimePickerField(controller: endTimeController)),
              ],
            ),
          ],
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
