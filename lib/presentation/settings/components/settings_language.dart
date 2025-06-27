// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_config/app_config_cubit.dart';
import 'package:water_tracker_app/app/l10n/generated/app_localizations.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/enum/language_code.dart';
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
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          titleSpacing: AppDimens.padding16,
          title: Row(
            spacing: AppDimens.padding12,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.getButtonColor(context),
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: AppDimens.iconSize20,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
              Text(
                'Language',
                style: TextStyle(
                  fontSize: AppDimens.fontSize20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ],
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(AppDimens.padding16),
          itemCount: AppLocalizations.supportedLocales.length,
          itemBuilder: (context, index) {
            final supportedLocale = AppLocalizations.supportedLocales[index];
            return _buildLanguageCard(
              context,
              language: LanguageCodeExtension.fromRawValue(
                supportedLocale.languageCode,
              ).rawValue,
              isSelected:
                  context.read<AppConfigCubit>().state.data.locale ==
                  supportedLocale,
              onTap: () {
                context.read<AppConfigCubit>().updateLocale(supportedLocale);
                context.pop();
              },
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: AppDimens.padding8),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context, {
    required Function()? onTap,
    required String language,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.padding16,
          vertical: AppDimens.padding20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
          color: isSelected == false ? AppColor.getCardColor(context) : null,
          gradient: isSelected ? AppColor.getColorfullCardColor(context) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: isSelected
                    ? AppColor.white
                    : AppColor.getWhiteBlack(context),
              ),
            ),
            if (isSelected)
              SvgPicture.asset(
                ImageConstant.check,
                colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                height: AppDimens.iconSize20,
              ),
          ],
        ),
      ),
    );
  }
}
