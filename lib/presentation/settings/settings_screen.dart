// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/presentation/settings/components/settings_quick_add_amounts.dart';
import 'package:water_tracker_app/presentation/settings/components/settings_reminders.dart';
import '../../app/theme/app_color.dart';
import '../../app/theme/app_dimens.dart';
import 'components/settings_appearance.dart';
import 'components/settings_header.dart';
import 'components/settings_hydration_calculator.dart';
import 'components/settings_profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
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
            controller: _scrollController,
            padding: const EdgeInsets.all(AppDimens.padding16),
            children: [
              SettingsHeader(),
              SizedBox(height: AppDimens.padding16),
              SettingsProfile(),
              SizedBox(height: AppDimens.padding16),
              SettingsAppearance(),
              SizedBox(height: AppDimens.padding16),
              SettingsReminder(),
              SizedBox(height: AppDimens.padding16),
              SettingsHydrationCalculator(),
              SizedBox(height: AppDimens.padding16),
              SettingsQuickAddAmounts(),
            ],
          ),
        ),
      ),
    );
  }
}
