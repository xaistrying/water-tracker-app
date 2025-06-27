// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class AiCameraMeasurementCard extends StatelessWidget {
  const AiCameraMeasurementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding16,
        vertical: AppDimens.padding20,
      ),
      decoration: BoxDecoration(
        gradient: AppColor.getColorfullCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppDimens.padding12,
        children: [
          SvgPicture.asset(
            ImageConstant.camera,
            colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            height: 48.0,
          ),
          Text(
            'AI Water Measurement',
            style: TextStyle(
              fontSize: AppDimens.fontSize18,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
          Text(
            'Take a photo to automatically measure water volume',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              color: AppColor.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColor.getButtonColor(context),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.padding16,
                  vertical: AppDimens.padding20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
                ),
                splashFactory: NoSplash.splashFactory,
                overlayColor: Colors.transparent,
              ),
              child: Text(
                'Open Camera',
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getBlueCyanColor(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
