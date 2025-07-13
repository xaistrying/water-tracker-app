// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class FeatureItemWidget extends StatelessWidget {
  const FeatureItemWidget({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.customTitle,
  });

  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final Widget? customTitle;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        minTileHeight: 0.0,
        minVerticalPadding: AppDimens.padding4,
        title:
            customTitle ??
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
        subtitle: Text(
          subtitle ?? '',
          style: TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            color: AppColor.getContentColor(context),
          ),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
