// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../../../app/widget/text_form_field_widget.dart';

class SettingsQuickAddAmounts extends StatelessWidget {
  const SettingsQuickAddAmounts({super.key});

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
          _buildApplyButton(context),
        ],
      ),
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: AppColor.getBlueCyanColor(context),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding16,
            vertical: AppDimens.padding16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
          ),
          splashFactory: NoSplash.splashFactory,
          overlayColor: Colors.transparent,
        ),
        child: Text(
          'Apply New Quick Add Amounts',
          style: TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context, reverse: true),
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      children: [
        _buildQuickAddButton(context, 'Button 1'),
        _buildQuickAddButton(context, 'Button 2'),
        _buildQuickAddButton(context, 'Button 3'),
      ],
    );
  }

  Widget _buildQuickAddButton(BuildContext context, String title) {
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
