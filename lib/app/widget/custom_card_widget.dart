// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import '../theme/app_color.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: AppDimens.padding16,
            vertical: AppDimens.padding20,
          ),
      decoration: BoxDecoration(
        color: AppColor.getCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      child: child,
    );
  }
}
