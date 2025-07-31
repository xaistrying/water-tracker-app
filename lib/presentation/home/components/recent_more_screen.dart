// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/double_extension.dart';
import '../../../app/constant/data_default.dart';
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
                context.loc.recent,
                style: TextStyle(
                  fontSize: AppDimens.fontSize20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            final listHistory = state.data.listIntakeHistory;
            final historyLength = listHistory.length;
            if (historyLength == 0) {
              return Center(
                child: Text(
                  context.loc.no_water_intake_data,
                  style: TextStyle(color: AppColor.getContentColor(context)),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(AppDimens.padding16),
              itemCount: listHistory.length,
              itemBuilder: (context, index) {
                final itemIndex = historyLength - index - 1;
                final item = listHistory[itemIndex];

                if (item.isDeleted == true) return const SizedBox.shrink();

                final dateTime = DateTime.tryParse(item.date ?? '');
                final decimalRange = (item.intake ?? 0.0).isDecimal()
                    ? DataDefault.decimalRange
                    : 0;
                String time = '';
                if (dateTime != null) {
                  time = DateFormat(
                    'dd/MM/yyyy hh:mm a',
                    'en_US',
                  ).format(dateTime);
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.padding8),
                  child: _buildRecentMeasurementCard(
                    context,
                    id: item.id,
                    time: time,
                    volume: item.intake?.toStringAsFixed(decimalRange) ?? '',
                    unit: item.unit ?? '',
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecentMeasurementCard(
    BuildContext context, {
    required String? id,
    required String time,
    required String volume,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
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
                '$volume$unit',
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
          if (DateFormat('dd/MM/yyyy hh:mm a', 'en_US').tryParse(time)?.day ==
                  DateTime.now().day &&
              id != null)
            IconButton(
              onPressed: () {
                context.read<AppDataCubit>().deleteSingleIntakeInDay(id: id);
              },
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                size: AppDimens.iconSize20,
                color: AppColor.getWhiteBlack(context),
              ),
            ),
        ],
      ),
    );
  }
}
