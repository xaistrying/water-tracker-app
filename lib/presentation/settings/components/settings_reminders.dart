// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
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
          trailing: BlocBuilder<AppDataCubit, AppDataState>(
            builder: (context, state) {
              return CupertinoSwitch(
                activeTrackColor: AppColor.getSwitchColor(
                  context,
                  isTrack: true,
                  isActive: true,
                ),
                inactiveTrackColor: AppColor.getSwitchColor(
                  context,
                  isTrack: true,
                ),
                thumbColor: AppColor.getSwitchColor(context, isActive: true),
                inactiveThumbColor: AppColor.getSwitchColor(context),
                value: state.data.reminderStatus,
                onChanged: (value) {
                  context.read<AppDataCubit>().updateReminderStatus(value);
                },
              );
            },
          ),
        ),
        FeatureItemWidget(
          title: 'Sound Effects',
          subtitle: 'Play sound for actions',
          trailing: BlocBuilder<AppDataCubit, AppDataState>(
            builder: (context, state) {
              return CupertinoSwitch(
                activeTrackColor: AppColor.getSwitchColor(
                  context,
                  isTrack: true,
                  isActive: true,
                ),
                inactiveTrackColor: AppColor.getSwitchColor(
                  context,
                  isTrack: true,
                ),
                thumbColor: AppColor.getSwitchColor(context, isActive: true),
                inactiveThumbColor: AppColor.getSwitchColor(context),
                value: state.data.soundEffectStatus,
                onChanged: (value) {
                  context.read<AppDataCubit>().updateSoundEffectStatus(value);
                },
              );
            },
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
                ValueListenableBuilder(
                  valueListenable: startTimeController,
                  builder: (context, value, child) {
                    final timeText1 = value.text;
                    final timeText2 = endTimeController.text;

                    final time1 = DateFormat('hh:mm a').tryParse(timeText1);
                    final time2 = DateFormat('hh:mm a').tryParse(timeText2);

                    if (time1 != null &&
                        time2 != null &&
                        time1.isAfter(time2)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        startTimeController.text = timeText2;
                        endTimeController.text = timeText1;
                      });
                    }

                    return Expanded(
                      child: TimePickerField(controller: startTimeController),
                    );
                  },
                ),
                Icon(Icons.arrow_forward_rounded, size: AppDimens.iconSize20),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: endTimeController,
                    builder: (context, value, child) {
                      final timeText1 = value.text;
                      final timeText2 = startTimeController.text;

                      final time1 = DateFormat('hh:mm a').tryParse(timeText1);
                      final time2 = DateFormat('hh:mm a').tryParse(timeText2);

                      if (time1 != null &&
                          time2 != null &&
                          time2.isAfter(time1)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          startTimeController.text = timeText1;
                          endTimeController.text = timeText2;
                        });
                      }

                      return TimePickerField(controller: endTimeController);
                    },
                  ),
                ),
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
