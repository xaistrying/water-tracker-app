// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

SnackBar newDaySnackbar(BuildContext context) => SnackBar(
  content: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'It\'s a new day!',
        style: TextStyle(
          color: AppColor.white,
          fontSize: AppDimens.fontSize16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'Water intake has been reset.',
        style: TextStyle(
          color: AppColor.white,
          fontSize: AppDimens.fontSizeDefault,
        ),
      ),
    ],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
  ),
  behavior: SnackBarBehavior.floating,
  elevation: 0,
  padding: const EdgeInsets.symmetric(
    horizontal: AppDimens.padding16,
    vertical: AppDimens.padding12,
  ),
  margin: const EdgeInsets.all(AppDimens.padding16),
  backgroundColor: AppColor.getGreenColor(context),
);
