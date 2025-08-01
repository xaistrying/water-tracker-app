// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/functions/unit_converter.dart';
import 'package:water_tracker_app/app/widget/dialog_widget.dart';
import 'package:water_tracker_app/app/widget/info_dialog_widget.dart';
import 'package:water_tracker_app/presentation/settings/widget/slider_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../widget/feature_item_widget.dart';

class SettingsDailyGoal extends StatelessWidget {
  const SettingsDailyGoal({super.key});

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: AppDimens.padding4),
            //   child: Text(
            //     context.loc.daily_goal,
            //     style: TextStyle(
            //       fontSize: AppDimens.fontSizeDefault,
            //       fontWeight: FontWeight.bold,
            //       color: AppColor.getWhiteBlack(context),
            //     ),
            //   ),
            // ),
            BlocBuilder<AppDataCubit, AppDataState>(
              builder: (context, state) {
                final dailyGoal = state.data.dailyGoal;
                final advancedModeStatus = state.data.advancedModeStatus;
                final unit = state.data.volumeUnitType.rawValue;
                bool isOz = state.data.volumeUnitType == VolumeUnitType.ounces;
                return SliderWidget(
                  min: isOz
                      ? UnitConverter.mlToOz(DataDefault.minDailyGoal)
                      : DataDefault.minDailyGoal,
                  max: advancedModeStatus
                      ? isOz
                            ? UnitConverter.mlToOz(
                                DataDefault.advancedxDailyGoal,
                              )
                            : DataDefault.advancedxDailyGoal
                      : isOz
                      ? UnitConverter.mlToOz(DataDefault.maxDailyGoal)
                      : DataDefault.maxDailyGoal,
                  value: advancedModeStatus
                      ? dailyGoal
                      : dailyGoal > DataDefault.maxDailyGoal
                      ? DataDefault.maxDailyGoal
                      : dailyGoal,
                  unit: unit,
                  divisions: isOz
                      ? null
                      : advancedModeStatus
                      ? DataDefault.dailyGoalAdvancedDivision
                      : DataDefault.dailyGoalDivision,
                  onChangeEnd: (newDailyGoal) {
                    if (newDailyGoal != dailyGoal) {
                      showDialog(
                        context: context,
                        builder: (context) => DialogWidget(
                          title: context.loc.change_daily_goal,
                          body: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: AppDimens.padding16,
                              ),
                              child: Text(
                                context.loc.change_daily_goal_dialog,
                                style: TextStyle(
                                  fontSize: AppDimens.fontSizeDefault,
                                  color: AppColor.getWhiteBlack(context),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          buttonName: context.loc.confirm,
                        ),
                      ).then((value) {
                        if (!context.mounted) return;
                        if (value == true) {
                          context.read<AppDataCubit>().updateDailyGoal(
                            value: newDailyGoal,
                          );
                        } else {
                          context.read<AppDataCubit>().updateDailyGoal(
                            value: dailyGoal,
                          );
                        }
                      });
                    }
                  },
                );
              },
            ),
          ],
        ),
        BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            final unit = state.data.volumeUnitType.rawValue;
            final isOz = state.data.volumeUnitType == VolumeUnitType.ounces;
            double advancedxDailyGoal = DataDefault.advancedxDailyGoal;
            if (isOz) {
              advancedxDailyGoal = UnitConverter.mlToOz(advancedxDailyGoal);
            }
            return FeatureItemWidget(
              customTitle: Row(
                spacing: AppDimens.padding4,
                children: [
                  Text(
                    context.loc.advanced_mode,
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
                          title: context.loc.advanced_mode,
                          content: context.loc.advanced_mode_dialog,
                        ),
                      );
                    },
                    constraints: const BoxConstraints(),
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
              subtitle: context.loc.advanced_mode_description(
                advancedxDailyGoal.toStringAsFixed(0),
                unit,
              ),
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
                    thumbColor: AppColor.getSwitchColor(
                      context,
                      isActive: true,
                    ),
                    inactiveThumbColor: AppColor.getSwitchColor(context),
                    value: advancedModeStatus,
                    onChanged: (value) {
                      if (value == false &&
                          dailyGoal > DataDefault.maxDailyGoal) {
                        context.read<AppDataCubit>().updateDailyGoal(
                          value: DataDefault.maxDailyGoal,
                        );
                      }
                      context.read<AppDataCubit>().updateAdvancedModeStatus(
                        status: value,
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.target,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.daily_goal,
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
