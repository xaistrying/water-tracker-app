// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_config/app_config_cubit.dart';
import 'package:water_tracker_app/presentation/settings/components/settings_quick_add_amounts.dart';
import 'package:water_tracker_app/presentation/settings/components/settings_reminders.dart';
import 'package:water_tracker_app/presentation/settings/cubit/hydration_calculator_cubit.dart';
import '../../app/theme/app_color.dart';
import '../../app/theme/app_dimens.dart';
import 'components/settings_appearance.dart';
import 'components/settings_header.dart';
import 'components/settings_hydration_calculator.dart';
import 'components/settings_profile.dart';
import 'components/settings_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();

  final _settingsHydrationCalculatorKey =
      GlobalKey<SettingsHydrationCalculatorState>();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0.0);
    }

    // Clear Settings Hydration Calculator Data When Switching Screen
    _settingsHydrationCalculatorKey.currentState?.bodyWeightTextController
        .clear();
    _settingsHydrationCalculatorKey.currentState?.excerciseTimeNotifier.value =
        0.0;
    context.read<HydrationCalculatorCubit>().updateCalculationResult(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: AppColor.getBackgroundColor(context)),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(AppDimens.padding16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SettingsHeader(),
                    const SizedBox(height: AppDimens.padding16),
                    const SettingsProfile(),
                    const SizedBox(height: AppDimens.padding16),
                    const SettingsAppearance(),
                    const SizedBox(height: AppDimens.padding16),
                    const SettingsReminder(),
                    const SizedBox(height: AppDimens.padding16),
                    SettingsHydrationCalculator(
                      key: _settingsHydrationCalculatorKey,
                    ),
                    const SizedBox(height: AppDimens.padding16),
                    const SettingsQuickAddAmounts(),
                    const SizedBox(height: AppDimens.padding16),
                    const SettingsStorage(),
                    const SizedBox(height: AppDimens.padding16),

                    // App Version
                    BlocBuilder<AppConfigCubit, AppConfigState>(
                      builder: (context, state) {
                        return Center(
                          child: Text(
                            'v${state.data.version ?? ''}',
                            style: TextStyle(
                              fontSize: AppDimens.fontSizeDefault,
                              color: AppColor.getWhiteBlack(context),
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
