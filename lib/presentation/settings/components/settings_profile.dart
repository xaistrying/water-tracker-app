// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/widget/dialog_widget.dart';
import 'package:water_tracker_app/app/widget/info_dialog_widget.dart';
import 'package:water_tracker_app/app/widget/text_form_field_widget.dart';
import 'package:water_tracker_app/presentation/settings/widget/slider_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../widget/feature_item_widget.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  final _userNameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final appDataCubit = context.read<AppDataCubit>().state.data;
    _userNameTextController.text = appDataCubit.userName;
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
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
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Your Name',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        TextFormFieldWidget(
          controller: _userNameTextController,
          onTapOutside: () => context.read<AppDataCubit>().updateUserName(
            _userNameTextController.text,
          ),
          isDense: false,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Daily Goal',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            final dailyGoal = state.data.dailyGoal;
            final advancedModeStatus = state.data.advancedModeStatus;
            return SliderWidget(
              min: DataDefault.minDailyGoal,
              max: advancedModeStatus
                  ? DataDefault.advancedxDailyGoal
                  : DataDefault.maxDailyGoal,
              value: advancedModeStatus
                  ? dailyGoal
                  : dailyGoal > DataDefault.maxDailyGoal
                  ? DataDefault.maxDailyGoal
                  : dailyGoal,
              unit: 'ml',
              divisions: advancedModeStatus
                  ? DataDefault.dailyGoalAdvancedDivision
                  : DataDefault.dailyGoalDivision,
              onChangeEnd: (newDailyGoal) {
                if (newDailyGoal != dailyGoal) {
                  showDialog(
                    context: context,
                    builder: (context) => DialogWidget(
                      title: 'Change Daily Goal',
                      body: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: AppDimens.padding16,
                          ),
                          child: Text('Confirm to change'),
                        ),
                      ),
                      buttonName: 'Confỉrm',
                    ),
                  ).then((value) {
                    if (!context.mounted) return;
                    if (value == true) {
                      context.read<AppDataCubit>().updateDailyGoal(
                        newDailyGoal,
                      );
                    } else {
                      context.read<AppDataCubit>().updateDailyGoal(dailyGoal);
                    }
                  });
                }
              },
            );
          },
        ),
        FeatureItemWidget(
          customTitle: Row(
            spacing: AppDimens.padding4,
            children: [
              Text(
                'Advanced Mode',
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => InfoDialogWidget(
                      title: 'Advanced Mode',
                      content:
                          'Very high water intake goals should be discussed '
                          'with a healthcare professional. Excessive water '
                          'consumption can be harmful.',
                    ),
                  );
                },
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                ),
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: AppColor.getWhiteBlack(context),
                ),
                iconSize: AppDimens.iconSize16,
              ),
            ],
          ),
          subtitle:
              'Unlock goal to '
              '${DataDefault.advancedxDailyGoal.toStringAsFixed(0)}ml',
          trailing: BlocBuilder<AppDataCubit, AppDataState>(
            builder: (context, state) {
              final dailyGoal = state.data.dailyGoal;
              final advancedModeStatus = state.data.advancedModeStatus;
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
                value: advancedModeStatus,
                onChanged: (value) {
                  if (value == false && dailyGoal > DataDefault.maxDailyGoal) {
                    context.read<AppDataCubit>().updateDailyGoal(
                      DataDefault.maxDailyGoal,
                    );
                  }
                  context.read<AppDataCubit>().updateAdvancedModeStatus();
                },
              );
            },
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
          ImageConstant.user,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Profile',
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
