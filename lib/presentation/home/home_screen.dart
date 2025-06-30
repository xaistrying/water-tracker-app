// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'components/daily_progress_card.dart';
import 'components/hydration_insights_card.dart';
import 'components/quick_add_widget.dart';
import 'components/recent_measurement_card.dart';

// import 'components/ai_camera_measurement_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(AppDimens.padding16),
            children: [
              HydrationInsightsCard(),
              SizedBox(height: AppDimens.padding16),
              DailyProgressCard(),
              SizedBox(height: AppDimens.padding16),
              // AiCameraMeasurementCard(),
              // SizedBox(height: AppDimens.padding16),
              QuickAddWidget(),
              SizedBox(height: AppDimens.padding16),
              RecentMeasurementCard(),
            ],
          ),
        ),
      ),
    );
  }
}
