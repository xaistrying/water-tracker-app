// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_config/app_config_cubit.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/presentation/settings/widget/segmented_button_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../widget/slider_widget.dart';

class SettingsHydrationCalculator extends StatelessWidget {
  const SettingsHydrationCalculator({super.key});

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
        ],
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      spacing: AppDimens.padding12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MARK: Body Weight
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Body Weight',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        Row(
          spacing: AppDimens.padding12,
          children: [
            Expanded(
              child: TextFormField(
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  color: AppColor.getWhiteBlack(context),
                ),
                textAlign: TextAlign.left,
                cursorColor: AppColor.getContentColor(context),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColor.getInputFieldColor(context),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.borderRadius4,
                    ),
                    borderSide: BorderSide(
                      color: AppColor.getGreyColorForText(context),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.borderRadius4,
                    ),
                    borderSide: BorderSide(
                      color: AppColor.getTextFieldBorderColor(context),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<AppConfigCubit, AppConfigState>(
              builder: (context, state) {
                return SegmentedButtonWidget(
                  values: [
                    UnitType.kilograms.rawValue,
                    UnitType.pounds.rawValue,
                  ],
                  selected: {state.data.weightUnitType.rawValue},
                  onSelectionChanged: (newSelected) =>
                      context.read<AppConfigCubit>().updateWeightUnitType(
                        UnitTypeExtension.fromRawValue(newSelected.first),
                      ),
                );
              },
            ),
          ],
        ),

        // MARK: Excercise Time
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Daily Excercise Time',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        SliderWidget(max: 180, unit: 'min', divisions: 12),

        // MARK: Recommendation
        Container(
          padding: EdgeInsets.all(AppDimens.padding16),
          decoration: BoxDecoration(
            color: AppColor.getTipCardColor(context),
            borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
          ),
          child: Column(
            children: [
              if (MediaQuery.of(context).size.width <= 360)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recommended Daily Intake',
                        style: TextStyle(
                          fontSize: AppDimens.fontSizeDefault,
                          fontWeight: FontWeight.bold,
                          color: AppColor.getWhiteBlack(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '2700ml',
                      style: TextStyle(
                        fontSize: AppDimens.fontSize20,
                        color: AppColor.getBlueCyanColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Daily Intake',
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        fontWeight: FontWeight.bold,
                        color: AppColor.getWhiteBlack(context),
                      ),
                    ),
                    Text(
                      '2700ml',
                      style: TextStyle(
                        fontSize: AppDimens.fontSize20,
                        color: AppColor.getBlueCyanColor(context),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: AppDimens.padding8),
              _buildListItem(
                context,
                text: 'Base: 2450ml (based on body weight)',
              ),
              SizedBox(height: AppDimens.padding4),
              _buildListItem(
                context,
                text: 'Exercise: +250ml (30 min activity)',
              ),
            ],
          ),
        ),

        // MARK: Apply Button
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColor.getBlueCyanColor(context),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.padding16,
                vertical: AppDimens.padding20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
              ),
              splashFactory: NoSplash.splashFactory,
              overlayColor: Colors.transparent,
            ),
            child: Text(
              'Apply Recommended Goal',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context, reverse: true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, {required String text}) => Row(
    spacing: AppDimens.padding8,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: AppDimens.padding4),
        child: Icon(
          Icons.circle,
          size: 8.0,
          color: AppColor.getWhiteBlack(context),
        ),
      ),
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ),
    ],
  );

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.drop,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Hydration Calculator',
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
      'Calculate your personalized daily water goal based on your body weight '
      'and activity level',
      style: TextStyle(
        fontSize: AppDimens.fontSizeDefault,
        color: AppColor.getContentColor(context),
      ),
    );
  }
}
