// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/enum/retention_period.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/presentation/settings/widget/segmented_button_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';

class SettingsStorage extends StatelessWidget {
  const SettingsStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        spacing: AppDimens.padding12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildInfo(context),
          _buildFeature(context),
          _buildInfoContent(context),
        ],
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<AppDataCubit, AppDataState>(
        builder: (context, state) {
          return SegmentedButtonWidget(
            values: RetentionPeriod.values.map((e) => e.rawValue).toList(),
            selected: {state.data.retentionPeriod.rawValue},
            onSelectionChanged: (newSelection) {
              context.read<AppDataCubit>().updateRetentionPeriod(
                RetentionPeriodExtension.fromRawValue(newSelection.first),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInfoContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.padding16),
      decoration: BoxDecoration(
        color: AppColor.getTipCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${context.loc.storage_info}: ',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getGreyColorForText(context),
              ),
            ),
            TextSpan(
              text: context.loc.storage_info_content,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.normal,
                color: AppColor.getGreyColorForText(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.storage,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.data_and_storage,
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Text(
      context.loc.data_and_storage_description,
      style: TextStyle(
        fontSize: AppDimens.fontSizeDefault,
        color: AppColor.getContentColor(context),
      ),
    );
  }
}
