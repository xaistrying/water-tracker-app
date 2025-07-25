// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_config/app_config_cubit.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/router/app_router.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/bloc/app_data/app_data_cubit.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/enum/language_code.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../widget/feature_item_widget.dart';
import '../widget/segmented_button_widget.dart';

class SettingsAppearance extends StatelessWidget {
  const SettingsAppearance({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        spacing: AppDimens.padding12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeader(context), _buildFeatures(context)],
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    return Column(
      spacing: AppDimens.padding12,
      children: [
        FeatureItemWidget(
          title: context.loc.dark_mode,
          subtitle: context.loc.dark_mode_description,
          trailing: CupertinoSwitch(
            activeTrackColor: AppColor.getSwitchColor(
              context,
              isTrack: true,
              isActive: true,
            ),
            inactiveTrackColor: AppColor.getSwitchColor(context, isTrack: true),
            thumbColor: AppColor.getSwitchColor(context, isActive: true),
            inactiveThumbColor: AppColor.getSwitchColor(context),
            value: context.isDarkMode ? true : false,
            onChanged: (value) {
              context.read<AppConfigCubit>().updateThemeMode(context);
            },
          ),
        ),
        FeatureItemWidget(
          title: context.loc.units,
          subtitle: context.loc.units_description,
          trailing: BlocBuilder<AppDataCubit, AppDataState>(
            buildWhen: (previous, current) => current is UpdateVolumeUnitType,
            builder: (context, state) {
              return SegmentedButtonWidget(
                values: [
                  VolumeUnitType.milliliters.rawValue,
                  VolumeUnitType.ounces.rawValue,
                ],
                selected: {state.data.volumeUnitType.rawValue},
                onSelectionChanged: (newSelection) =>
                    context.read<AppDataCubit>().updateVolumeUnitType(
                      VolumeUnitTypeExtension.fromRawValue(newSelection.first),
                    ),
              );
            },
          ),
        ),
        BlocBuilder<AppConfigCubit, AppConfigState>(
          buildWhen: (previous, current) => current is UpdateLocaleState,
          builder: (context, state) {
            return FeatureItemWidget(
              title: context.loc.language,
              subtitle: LanguageCodeExtension.fromRawValue(
                state.data.locale?.languageCode ?? '',
              ).rawValue,
              trailing: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.padding12,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.getGreyColorForText(context),
                  size: AppDimens.iconSize16,
                ),
              ),
              onTap: () => context.push(AppRouter.language),
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
          ImageConstant.palette,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.appearance,
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
