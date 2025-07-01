// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../theme/app_color.dart';
import '../theme/app_dimens.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    this.body,
    this.buttonName,
    this.buttonFunc,
  });

  final String title;
  final Widget? body;
  final String? buttonName;
  final Function()? buttonFunc;

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
            // MARK: Header
            Text(
              title,
              style: TextStyle(
                fontSize: AppDimens.fontSize18,
                fontWeight: FontWeight.bold,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
            // MARK: Body
            body ?? SizedBox.shrink(),

            // MARK: Actions
            const SizedBox(height: AppDimens.padding20),
            Row(
              spacing: AppDimens.padding12,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(false),
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
                      'Cancel',
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        fontWeight: FontWeight.bold,
                        color: AppColor.getContentColor(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (buttonFunc != null) buttonFunc?.call();
                      context.pop(true);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.getBlueCyanColor(context),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding16,
                        vertical: AppDimens.padding16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimens.borderRadius4,
                        ),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.transparent,
                    ),
                    child: Text(
                      buttonName ?? 'Confirm',
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        fontWeight: FontWeight.bold,
                        color: AppColor.getWhiteBlack(context, reverse: true),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
