// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class RecentMoreScreen extends StatelessWidget {
  const RecentMoreScreen({super.key});

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
                'Recent',
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
          itemCount: 4,
          itemBuilder: (context, index) {
            return _buildRecentMeasurementCard(
              context,
              time: '28/06/2025 - 10:00 AM',
              volume: '200ml',
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: AppDimens.padding8),
        ),
      ),
    );
  }

  Widget _buildRecentMeasurementCard(
    BuildContext context, {
    required String time,
    required String volume,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.padding16,
        vertical: AppDimens.padding16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
        color: AppColor.getCardColor(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: AppDimens.padding4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                volume,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  color: AppColor.getGreyColorForText(context),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.padded,
              splashFactory: NoSplash.splashFactory,
            ),
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              size: AppDimens.iconSize28,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ],
      ),
    );
  }
}
