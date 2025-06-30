// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/widget/dialog_widget.dart';
import 'package:water_tracker_app/app/widget/text_form_field_widget.dart';
import 'package:water_tracker_app/presentation/settings/widget/slider_widget.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  final _userNameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final appDataCubit = context.read<AppDataCubit>().state.data;
    _userNameTextController.text = appDataCubit.userName;
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        spacing: AppDimens.padding12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildHeader(context), _buildFeature(context)],
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      spacing: AppDimens.padding12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Your Name',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        TextFormFieldWidget(
          controller: _userNameTextController,
          onTapOutside: () => context.read<AppDataCubit>().updateUserName(
            _userNameTextController.text,
          ),
          isDense: false,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            'Daily Goal',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        BlocBuilder<AppDataCubit, AppDataState>(
          builder: (context, state) {
            final dailyGoal = state.data.dailyGoal;
            return SliderWidget(
              min: 1000,
              max: 4000,
              value: dailyGoal,
              unit: 'ml',
              divisions: 30,
              onChangeEnd: (newDailyGoal) {
                showDialog(
                  context: context,
                  builder: (context) => DialogWidget(
                    title: 'Change Daily Goal',
                    body: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: AppDimens.padding16,
                        ),
                        child: Text('Confirm to change'),
                      ),
                    ),
                    buttonName: 'Confỉrm',
                  ),
                ).then((value) {
                  if (!context.mounted) return;
                  if (value == true) {
                    context.read<AppDataCubit>().updateDailyGoal(newDailyGoal);
                  } else {
                    context.read<AppDataCubit>().updateDailyGoal(dailyGoal);
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.user,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          'Profile',
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ],
    );
  }
}
