// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';
import '../theme/app_color.dart';
import '../theme/app_dimens.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.getDialogColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.padding24),
        constraints: BoxConstraints(maxWidth: 400.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppDimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.padding16),
            Text(
              content,
              style: TextStyle(
                fontSize: AppDimens.fontSizeDefault,
                color: AppColor.getWhiteBlack(context),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimens.padding20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => context.pop(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding16,
                    vertical: AppDimens.padding16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.borderRadius4,
                    ),
                  ),
                  side: BorderSide(
                    width: AppDimens.borderWidth1,
                    color: AppColor.getContentColor(context),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                ),
                child: Text(
                  context.loc.close,
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeDefault,
                    fontWeight: FontWeight.bold,
                    color: AppColor.getContentColor(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
