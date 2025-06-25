// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/presentation/home/components/ai_camera_measurement_card.dart';
import 'package:water_tracker_app/presentation/home/components/hydration_insights_card.dart';
import 'package:water_tracker_app/presentation/home/components/quick_add_widget.dart';
import 'components/daily_progress_card.dart';
import 'components/recent_measurement_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(AppDimens.padding16),
          children: [
            HydrationInsightsCard(),
            SizedBox(height: AppDimens.padding16),
            DailyProgressCard(),
            SizedBox(height: AppDimens.padding16),
            AiCameraMeasurementCard(),
            SizedBox(height: AppDimens.padding16),
            QuickAddWidget(),
            SizedBox(height: AppDimens.padding16),
            RecentMeasurementCard(),
          ],
        ),
      ),
    );
  }
}
