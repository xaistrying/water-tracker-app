// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class QuickAddCustomDialog extends StatelessWidget {
  const QuickAddCustomDialog({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MARK: Header
            Align(
              alignment: Alignment.center,
              child: Text(
                'Add Custom Amount',
                style: TextStyle(
                  fontSize: AppDimens.fontSize18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ),
            // MARK: Input Field
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimens.padding16,
                bottom: AppDimens.padding8,
              ),
              child: Text(
                'Amount (ml)',
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ),
            TextFormField(
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
                filled: true,
                fillColor: AppColor.getInputFieldColor(context),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
                  borderSide: BorderSide(
                    color: AppColor.getGreyColorForText(context),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
                  borderSide: BorderSide(
                    color: AppColor.getTextFieldBorderColor(context),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimens.padding20),
            // MARK: Actions
            Row(
              spacing: AppDimens.padding12,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding16,
                        vertical: AppDimens.padding20,
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.getBlueCyanColor(context),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding16,
                        vertical: AppDimens.padding20,
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
                      'Add Water',
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
