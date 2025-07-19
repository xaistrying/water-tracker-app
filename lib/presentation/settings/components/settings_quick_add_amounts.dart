// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/quick_add_option.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../../../app/widget/dialog_widget.dart';
import '../../../app/widget/text_form_field_widget.dart';

class SettingsQuickAddAmounts extends StatefulWidget {
  const SettingsQuickAddAmounts({super.key});

  @override
  State<SettingsQuickAddAmounts> createState() =>
      _SettingsQuickAddAmountsState();
}

class _SettingsQuickAddAmountsState extends State<SettingsQuickAddAmounts> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    final appDataCubit = context.read<AppDataCubit>().state.data;
    _controllers.add(TextEditingController(text: appDataCubit.quickAddValue1));
    _controllers.add(TextEditingController(text: appDataCubit.quickAddValue2));
    _controllers.add(TextEditingController(text: appDataCubit.quickAddValue3));
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppDataCubit, AppDataState>(
      listenWhen: (previous, current) =>
          current is UpdateQuickAddValue1 ||
          current is UpdateQuickAddValue2 ||
          current is UpdateQuickAddValue3,
      listener: (context, state) {
        _controllers[0].text = state.data.quickAddValue1;
        _controllers[1].text = state.data.quickAddValue2;
        _controllers[2].text = state.data.quickAddValue3;
      },
      child: CustomCardWidget(
        child: Column(
          spacing: AppDimens.padding12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildInfo(context),
            _buildFeature(context),
            _buildTipContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      children: [
        _buildQuickAddButton(
          context,
          controller: _controllers[QuickAddOption.first.rawValue],
          option: QuickAddOption.first,
          title: 'Button ${QuickAddOption.first.rawValue + 1}',
        ),
        _buildQuickAddButton(
          context,
          controller: _controllers[QuickAddOption.second.rawValue],
          option: QuickAddOption.second,
          title: 'Button ${QuickAddOption.second.rawValue + 1}',
        ),
        _buildQuickAddButton(
          context,
          controller: _controllers[QuickAddOption.third.rawValue],
          option: QuickAddOption.third,
          title: 'Button ${QuickAddOption.third.rawValue + 1}',
        ),
      ],
    );
  }

  Widget _buildQuickAddButton(
    BuildContext context, {
    required TextEditingController controller,
    required QuickAddOption option,
    required String title,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          fontWeight: FontWeight.bold,
          color: AppColor.getWhiteBlack(context),
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: BlocBuilder<AppDataCubit, AppDataState>(
          buildWhen: (previous, current) => current is UpdateVolumeUnitType,
          builder: (context, state) {
            final volumeType = state.data.volumeUnitType;
            final isDecimal = volumeType == VolumeUnitType.ounces;
            return Row(
              spacing: AppDimens.padding8,
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    controller: controller,
                    isDigitsOnly: true,
                    isDecimal: isDecimal,
                    maxLength:
                        DataDefault.maxInputAmountLength + (isDecimal ? 2 : 0),
                    onTapOutside: () => controller.text = context
                        .read<AppDataCubit>()
                        .updateSpecificQuickAddValue(
                          option: option,
                          value: controller.text,
                        ),
                  ),
                ),
                Text(
                  volumeType.rawValue,
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeDefault,
                    color: AppColor.getContentColor(context),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTipContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.padding16),
      decoration: BoxDecoration(
        color: AppColor.getTipCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Tip: ',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getGreyColorForText(context),
              ),
            ),
            TextSpan(
              text:
                  'Set these to your most common drink sizes (e.g., your '
                  'favorite glass, water bottle, or mug capacity)',
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
          ImageConstant.drop,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Quick Add Amounts',
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => DialogWidget(
                title: 'Reset to Default Value',
                body: Padding(
                  padding: const EdgeInsets.only(top: AppDimens.padding12),
                  child: Text(
                    'This will reset your Quick-add buttons to their '
                    'default values.',
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getWhiteBlack(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ).then((value) {
              if (!context.mounted) return;
              if (value) {
                context.read<AppDataCubit>().resetAllQuickAddValue();
                DataDefault.quickAddValue.asMap().entries.forEach((entry) {
                  final index = entry.key;
                  final value = entry.value;
                  _controllers[index].text = value.toString();
                });
              }
            });
          },
          padding: EdgeInsets.only(right: AppDimens.padding4),
          constraints: BoxConstraints(),
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: SvgPicture.asset(
            ImageConstant.refresh,
            colorFilter: ColorFilter.mode(
              AppColor.getWhiteBlack(context),
              BlendMode.srcIn,
            ),
            height: AppDimens.iconSize16,
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Text(
      'Customize your quick-add buttons for common drink sizes.',
      style: TextStyle(
        fontSize: AppDimens.fontSizeDefault,
        color: AppColor.getContentColor(context),
      ),
    );
  }
}
