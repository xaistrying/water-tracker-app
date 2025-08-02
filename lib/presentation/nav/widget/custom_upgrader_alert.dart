// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:upgrader/upgrader.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/string_extension.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import '../../../app/theme/app_color.dart';

class CustomUpgraderAlert extends UpgradeAlert {
  CustomUpgraderAlert({
    super.key,
    super.upgrader,
    super.child,
    super.onIgnore,
    super.onUpdate,
    super.onLater,
    super.dialogStyle,
    super.showIgnore,
    super.showReleaseNotes,
  });

  @override
  UpgradeAlertState createState() => CustomUpgraderAlertState();
}

class CustomUpgraderAlertState extends UpgradeAlertState {
  @override
  void showTheDialog({
    Key? key,
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool barrierDismissible,
    required UpgraderMessages messages,
  }) {
    widget.upgrader.saveLastAlerted();

    final appName = widget.upgrader.appName();
    final currentVersion = widget.upgrader.currentAppStoreVersion ?? '';
    final installedVersion = widget.upgrader.currentInstalledVersion ?? '';

    final formattedBody = messages.body
        .replaceAll('{{appName}}', appName)
        .replaceAll('{{currentAppStoreVersion}}', currentVersion)
        .replaceAll('{{currentInstalledVersion}}', installedVersion);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          key: key,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
              color: AppColor.getDialogColor(context),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.padding24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    messages.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimens.fontSize18,
                    ),
                  ),
                  const SizedBox(height: AppDimens.padding8),
                  Text(
                    formattedBody,
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getWhiteBlack(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimens.padding16),
                  Text(
                    messages.prompt,
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getWhiteBlack(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimens.padding24),
                  CustomButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    text: messages.buttonTitleIgnore,
                    onPressed: () {
                      onUserIgnored(context, true);
                    },
                  ),
                  const SizedBox(height: AppDimens.padding8),
                  CustomButton(
                    color: Colors.white,
                    textColor: Colors.grey,
                    text: messages.buttonTitleLater,
                    onPressed: () {
                      onUserLater(context, true);
                    },
                  ),
                  const SizedBox(height: AppDimens.padding8),
                  CustomButton(
                    color: Colors.white,
                    textColor: Colors.grey,
                    text: messages.buttonTitleUpdate,
                    isButtonTitleUpdate: true,
                    onPressed: () {
                      onUserUpdated(context, !widget.upgrader.blocked());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;
  final Function() onPressed;
  final bool isButtonTitleUpdate;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isButtonTitleUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => context.pop(false),
        style: TextButton.styleFrom(
          backgroundColor: isButtonTitleUpdate
              ? AppColor.getBlueCyanColor(context)
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding16,
            vertical: AppDimens.padding16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
          ),
          side: isButtonTitleUpdate
              ? BorderSide.none
              : BorderSide(
                  width: AppDimens.borderWidth1,
                  color: AppColor.getContentColor(context),
                ),
          splashFactory: NoSplash.splashFactory,
          overlayColor: Colors.transparent,
        ),
        child: Text(
          text.toCapitalized(),
          style: TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(
              context,
              reverse: isButtonTitleUpdate,
            ),
          ),
        ),
      ),
    );
  }
}
