// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import 'package:water_tracker_app/presentation/home/home_screen.dart';
import 'package:water_tracker_app/presentation/settings/settings_screen.dart';
import 'package:water_tracker_app/presentation/statistics/statistics_screen.dart';
import '../../app/constant/image_constant.dart';
import '../../app/theme/app_color.dart';
import 'widget/new_day_snack_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    super.key,
    required this.navigationShell,
    required this.homeScreenKey,
    required this.statisticsScreenKey,
    required this.settingsScreenKey,
  });

  final StatefulNavigationShell navigationShell;
  final GlobalKey<HomeScreenState> homeScreenKey;
  final GlobalKey<StatisticsScreenState> statisticsScreenKey;
  final GlobalKey<SettingsScreenState> settingsScreenKey;

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with WidgetsBindingObserver {
  late final AppLifecycleListener _listener;

  void _beforeClosingApp() {
    context.read<AppDataCubit>().beforeClosingTask();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listener = AppLifecycleListener(
      onRestart: _beforeClosingApp,
      onDetach: _beforeClosingApp,
      onPause: _beforeClosingApp,
      onInactive: _beforeClosingApp,
      onHide: _beforeClosingApp,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppDataCubit, AppDataState>(
      listenWhen: (previous, current) => current is MidnightState,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(newDaySnackbar(context));
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(
              height: 0,
              thickness: AppDimens.borderWidth2,
              color: AppColor.getNavBorderColor(context),
            ),

            NavigationBar(
              height: kBottomNavigationBarHeight,
              selectedIndex: widget.navigationShell.currentIndex,
              onDestinationSelected: (index) {
                if (index != widget.navigationShell.currentIndex) {
                  switch (index) {
                    case 0:
                      widget.homeScreenKey.currentState?.scrollToTop();
                      break;
                    case 1:
                      widget.statisticsScreenKey.currentState?.scrollToTop();
                      break;
                    case 2:
                      widget.settingsScreenKey.currentState?.scrollToTop();
                      break;
                  }
                }
                widget.navigationShell.goBranch(index);
              },
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.asset(
                    ImageConstant.drop,
                    colorFilter: ColorFilter.mode(
                      widget.navigationShell.currentIndex == 0
                          ? AppColor.getActiveIconColor(context)
                          : AppColor.getWhiteBlack(context),
                      BlendMode.srcIn,
                    ),
                    height: AppDimens.iconSize20,
                  ),
                  label: context.loc.home,
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    ImageConstant.chart,
                    colorFilter: ColorFilter.mode(
                      widget.navigationShell.currentIndex == 1
                          ? AppColor.getActiveIconColor(context)
                          : AppColor.getWhiteBlack(context),
                      BlendMode.srcIn,
                    ),
                    height: AppDimens.iconSize20,
                  ),
                  label: context.loc.statistics,
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    ImageConstant.setting,
                    colorFilter: ColorFilter.mode(
                      widget.navigationShell.currentIndex == 2
                          ? AppColor.getActiveIconColor(context)
                          : AppColor.getWhiteBlack(context),
                      BlendMode.srcIn,
                    ),
                    height: AppDimens.iconSize20,
                  ),
                  label: context.loc.settings,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
