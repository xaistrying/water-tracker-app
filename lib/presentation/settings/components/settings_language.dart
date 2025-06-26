// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            style: IconButton.styleFrom(),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: AppDimens.iconSize20,
              color: AppColor.white,
            ),
          ),
          title: Text(
            'Language',
            style: TextStyle(
              fontSize: AppDimens.fontSize20,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
      ),
    );
  }
}
