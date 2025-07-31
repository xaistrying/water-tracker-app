// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/date_time_extension.dart';
import 'package:water_tracker_app/app/extension/string_extension.dart';
import 'package:water_tracker_app/app/extension/time_of_day_extension.dart';
import 'package:water_tracker_app/app/service/notification_service.dart';
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

class _SettingsReminderState extends State<SettingsReminder>
    with AutomaticKeepAliveClientMixin {
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final appDataState = context.read<AppDataCubit>().state;
    String? startTime = appDataState.data.startTime;
    String? endTime = appDataState.data.endTime;

    startTimeController.text =
        startTime ?? DataDefault.startTime.toDateTime().toTimeString();
    endTimeController.text =
        endTime ?? DataDefault.endTime.toDateTime().toTimeString();
  }

  @override
  void dispose() {
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          title: context.loc.enable_reminders,
          subtitle: context.loc.enable_reminders_description,
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
                  if (value) {
                    NotificationService()
                        .requestNotificationIfNeeded(context)
                        .then((isAllowed) {
                          if (context.mounted && isAllowed) {
                            context.read<AppDataCubit>().updateReminderStatus(
                              value,
                            );
                          }
                        });
                  } else {
                    context.read<AppDataCubit>().updateReminderStatus(value);
                  }
                },
              );
            },
          ),
        ),
        FeatureItemWidget(
          title: context.loc.sound_effects,
          subtitle: context.loc.sound_effects_description,
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
              context.loc.reminder_interval,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
            BlocBuilder<AppDataCubit, AppDataState>(
              builder: (context, state) {
                return SliderWidget(
                  max: 180,
                  min: 15,
                  unit: 'min',
                  divisions: 33,
                  value: state.data.reminderInterval,
                  onChangeEnd: (newValue) {
                    context.read<AppDataCubit>().updateReminderInterval(
                      newValue,
                    );
                  },
                );
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.padding4),
              child: Text(
                context.loc.active_hours,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ),
            Text(
              context.loc.active_hours_description,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: AppColor.getContentColor(context),
              ),
            ),
            const SizedBox(height: AppDimens.padding12),
            Row(
              spacing: AppDimens.padding4,
              children: [
                ValueListenableBuilder(
                  valueListenable: startTimeController,
                  builder: (context, value, child) {
                    final timeText1 = value.text;
                    final timeText2 = endTimeController.text;

                    final time1 = timeText1.toDateTimeOrNull();
                    final time2 = timeText2.toDateTimeOrNull();

                    if (time1 != null &&
                        time2 != null &&
                        time1.isAfter(time2)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        startTimeController.text = timeText2;
                        endTimeController.text = timeText1;
                      });
                    }

                    context.read<AppDataCubit>().updateStartTime(
                      startTimeController.text,
                    );
                    context.read<AppDataCubit>().updateEndTime(
                      endTimeController.text,
                    );

                    return Expanded(
                      child: TimePickerField(
                        controller: startTimeController,
                        initialTime:
                            value.text.toDateTimeOrNull()?.toTimeOfDay() ??
                            TimeOfDay.now(),
                      ),
                    );
                  },
                ),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: AppDimens.iconSize20,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: endTimeController,
                    builder: (context, value, child) {
                      final timeText1 = value.text;
                      final timeText2 = startTimeController.text;

                      final time1 = timeText1.toDateTimeOrNull();
                      final time2 = timeText2.toDateTimeOrNull();

                      if (time1 != null &&
                          time2 != null &&
                          time2.isAfter(time1)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          startTimeController.text = timeText1;
                          endTimeController.text = timeText2;
                        });
                      }

                      context.read<AppDataCubit>().updateStartTime(
                        startTimeController.text,
                      );
                      context.read<AppDataCubit>().updateEndTime(
                        endTimeController.text,
                      );

                      return TimePickerField(
                        controller: endTimeController,
                        initialTime:
                            value.text.toDateTimeOrNull()?.toTimeOfDay() ??
                            TimeOfDay.now(),
                      );
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
          context.loc.reminders,
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
