// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/theme/app_dimens.dart';
import '../../app/constant/image_constant.dart';
import '../../app/theme/app_color.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(
            height: 0,
            thickness: AppDimens.borderWidth,
            color: AppColor.getNavBorderColor(context),
          ),

          NavigationBar(
            height: kBottomNavigationBarHeight,
            selectedIndex: navigationShell.currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onDestinationSelected: (index) => navigationShell.goBranch(index),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  ImageConstant.drop,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 0
                        ? AppColor.getActiveIconColor(context)
                        : AppColor.getWhiteBlack(context),
                    BlendMode.srcIn,
                  ),
                  height: AppDimens.navIconHeight,
                ),
                label: context.loc.home,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  ImageConstant.chart,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 1
                        ? AppColor.getActiveIconColor(context)
                        : AppColor.getWhiteBlack(context),
                    BlendMode.srcIn,
                  ),
                  height: AppDimens.navIconHeight,
                ),
                label: context.loc.statistics,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  ImageConstant.setting,
                  colorFilter: ColorFilter.mode(
                    navigationShell.currentIndex == 2
                        ? AppColor.getActiveIconColor(context)
                        : AppColor.getWhiteBlack(context),
                    BlendMode.srcIn,
                  ),
                  height: AppDimens.navIconHeight,
                ),
                label: context.loc.settings,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
