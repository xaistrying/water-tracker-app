// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/enum/quick_add_option.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
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
    return CustomCardWidget(
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
        child: Row(
          spacing: AppDimens.padding8,
          children: [
            Expanded(
              child: TextFormFieldWidget(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: controller,
                onTapOutside: () =>
                    context.read<AppDataCubit>().updateSpecificQuickAddValue(
                      option: option,
                      value: controller.text,
                    ),
              ),
            ),
            Text(
              'ml',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: AppColor.getContentColor(context),
              ),
            ),
          ],
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
      child: Text(
        'Tip: Set these to your most common drink sizes (e.g., your favorite '
        'glass, water bottle, or mug capacity).',
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          color: AppColor.getGreyColorForText(context),
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
