// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
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
                    current is UpdateQuickAddValue1,
                builder: (context, state) {
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {},
                    label: '${state.data.quickAddValue1}ml',
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                buildWhen: (previous, current) =>
                    current is UpdateQuickAddValueAll ||
                    current is UpdateQuickAddValue2,
                builder: (context, state) {
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {},
                    label: '${state.data.quickAddValue2}ml',
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                buildWhen: (previous, current) =>
                    current is UpdateQuickAddValueAll ||
                    current is UpdateQuickAddValue3,
                builder: (context, state) {
                  return _buildQuickAddButton(
                    context,
                    onPressed: () {},
                    label: '${state.data.quickAddValue3}ml',
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
              builder: (context) => QuickAddCustomDialog(),
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
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.padding12,
            vertical: AppDimens.padding16,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: Colors.transparent,
        ),
        icon: SvgPicture.asset(
          ImageConstant.add,
          colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
          height: AppDimens.iconSize16,
        ),
        label: Text(
          'Custom',
          style: TextStyle(
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
        padding: EdgeInsets.symmetric(
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
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
