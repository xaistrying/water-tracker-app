// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/presentation/home/components/quick_add_custom_dialog.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';

class QuickAddWidget extends StatelessWidget {
  const QuickAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppDimens.padding12,
      children: [
        Row(
          spacing: AppDimens.padding12,
          children: [
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                buildWhen: (previous, current) =>
                    current is UpdateQuickAddValueAll ||
                    current is UpdateQuickAddValue1 ||
                    current is UpdateVolumeUnitType,
                builder: (context, state) {
                  final quickAddValue1 = state.data.quickAddValue1;
                  final unit = state.data.volumeUnitType.rawValue;
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {
                      final intake = double.tryParse(quickAddValue1) ?? 0;
                      context.read<AppDataCubit>().updateDailyIntake(
                        value: intake,
                      );
                    },
                    label: '$quickAddValue1$unit',
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                buildWhen: (previous, current) =>
                    current is UpdateQuickAddValueAll ||
                    current is UpdateQuickAddValue2 ||
                    current is UpdateVolumeUnitType,
                builder: (context, state) {
                  final quickAddValue2 = state.data.quickAddValue2;
                  final unit = state.data.volumeUnitType.rawValue;
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {
                      final intake = double.tryParse(quickAddValue2) ?? 0;
                      context.read<AppDataCubit>().updateDailyIntake(
                        value: intake,
                      );
                    },
                    label: '$quickAddValue2$unit',
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                buildWhen: (previous, current) =>
                    current is UpdateQuickAddValueAll ||
                    current is UpdateQuickAddValue3 ||
                    current is UpdateVolumeUnitType,
                builder: (context, state) {
                  final quickAddValue3 = state.data.quickAddValue3;
                  final unit = state.data.volumeUnitType.rawValue;
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {
                      final intake = double.tryParse(quickAddValue3) ?? 0;
                      context.read<AppDataCubit>().updateDailyIntake(
                        value: intake,
                      );
                    },
                    label: '$quickAddValue3$unit',
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: _buildCustomButton(
            context,
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const QuickAddCustomDialog(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomButton(BuildContext context, {Function()? onPressed}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppColor.getColorfullCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
      ),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding12,
            vertical: AppDimens.padding16,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: Colors.transparent,
        ),
        icon: SvgPicture.asset(
          ImageConstant.add,
          colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
          height: AppDimens.iconSize16,
        ),
        label: Text(
          context.loc.custom,
          style: const TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAddButton(
    BuildContext context, {
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColor.getCardColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
        ),
        side: BorderSide(
          color: AppColor.getNavBorderColor(context),
          width: AppDimens.borderWidth2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding12,
          vertical: AppDimens.padding16,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: AppColor.getWhiteBlack(context),
        overlayColor: Colors.transparent,
      ),
      icon: SvgPicture.asset(
        ImageConstant.add,
        colorFilter: ColorFilter.mode(
          AppColor.getWhiteBlack(context),
          BlendMode.srcIn,
        ),
        height: AppDimens.iconSize16,
      ),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
