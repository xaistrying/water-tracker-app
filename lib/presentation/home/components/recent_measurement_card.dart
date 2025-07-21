// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/double_extension.dart';
import 'package:water_tracker_app/app/theme/app_color.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/app/widget/custom_card_widget.dart';
import '../../../app/constant/data_default.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/router/app_router.dart';

class RecentMeasurementCard extends StatelessWidget {
  const RecentMeasurementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding16,
        vertical: AppDimens.padding8,
      ),
      child: Column(
        spacing: AppDimens.padding12,
        children: [
          _buildRecentMeasurementHeader(context),
          _buildRecentMeasurementList(context),
        ],
      ),
    );
  }

  Widget _buildRecentMeasurementList(BuildContext context) {
    return BlocBuilder<AppDataCubit, AppDataState>(
      builder: (context, state) {
        final listHistory = state.data.listIntakeHistory;
        final historyLength = listHistory.length;
        if (historyLength == 0) {
          return Column(
            children: [
              Text(
                context.loc.no_water_intake_data,
                style: TextStyle(color: AppColor.getContentColor(context)),
              ),
              SizedBox(height: AppDimens.padding12),
            ],
          );
        }
        return Column(
          spacing: AppDimens.padding12,
          children: List.generate(historyLength < 3 ? historyLength : 3, (
            index,
          ) {
            final itemIndex = historyLength - index - 1;
            final item = listHistory[itemIndex];
            final dateTime = DateTime.tryParse(item.date ?? '');
            final decimalRange = (item.intake ?? 0.0).isDecimal()
                ? DataDefault.decimalRange
                : 0;
            String time = '';
            if (dateTime != null) {
              time = DateFormat.yMd().addPattern('hh:mm a').format(dateTime);
            }
            return _buildRecentMeasurementItem(
              context,
              time: time,
              volume: item.intake?.toStringAsFixed(decimalRange) ?? '',
              unit: item.unit ?? state.data.volumeUnitType.rawValue,
            );
          }),
        );
      },
    );
  }

  Widget _buildRecentMeasurementHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.history,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.recent,
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
        Spacer(),
        TextButton.icon(
          onPressed: () => context.push(AppRouter.recentMore),
          label: Text(
            context.loc.more,
            style: TextStyle(color: AppColor.getGreyColorForText(context)),
          ),
          iconAlignment: IconAlignment.end,
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            overlayColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.getGreyColorForText(context),
            size: AppDimens.iconSize16,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentMeasurementItem(
    BuildContext context, {
    required String time,
    required String volume,
    required String unit,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppDimens.padding4,
        vertical: 0.0,
      ),
      horizontalTitleGap: AppDimens.padding8,
      leading: Icon(
        Icons.circle,
        size: 8.0,
        color: AppColor.getBlueCyanColor(context),
      ),
      title: Text(
        '$volume$unit',
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          fontWeight: FontWeight.bold,
          color: AppColor.getWhiteBlack(context),
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontSize: AppDimens.fontSizeDefault,
          color: AppColor.getGreyColorForText(context),
        ),
      ),
    );
  }
}
