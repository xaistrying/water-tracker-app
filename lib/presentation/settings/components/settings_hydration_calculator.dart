// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:water_tracker_app/app/constant/data_default.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/functions/unit_converter.dart';
import 'package:water_tracker_app/app/widget/dialog_widget.dart';
import 'package:water_tracker_app/app/widget/info_dialog_widget.dart';
import 'package:water_tracker_app/presentation/settings/cubit/hydration_calculator_cubit.dart';
import 'package:water_tracker_app/presentation/settings/widget/segmented_button_widget.dart';
import '../../../app/bloc/app_data/app_data_cubit.dart';
import '../../../app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/custom_card_widget.dart';
import '../../../app/widget/text_form_field_widget.dart';
import '../widget/slider_widget.dart';

class SettingsHydrationCalculator extends StatefulWidget {
  const SettingsHydrationCalculator({super.key});

  @override
  State<SettingsHydrationCalculator> createState() =>
      SettingsHydrationCalculatorState();
}

class SettingsHydrationCalculatorState
    extends State<SettingsHydrationCalculator> {
  final bodyWeightTextController = TextEditingController();
  final baseTextController = TextEditingController();
  final excerciseTimeNotifier = ValueNotifier<double>(0.0);

  @override
  void dispose() {
    super.dispose();
    bodyWeightTextController.dispose();
    baseTextController.dispose();
    excerciseTimeNotifier.dispose();
  }

  void _calculateResult({
    required double bodyWeight,
    required double excerciseTime,
  }) {
    bool isOz =
        context.read<AppDataCubit>().state.data.volumeUnitType ==
        VolumeUnitType.ounces;
    double calculationResult =
        bodyWeight * DataDefault.bodyWeightMultiplier +
        excerciseTime * DataDefault.exerciseTimeMultiplier;
    if (isOz) {
      calculationResult = UnitConverter.mlToOz(calculationResult);
    }
    context.read<HydrationCalculatorCubit>().updateCalculationResult(
      calculationResult,
    );
  }

  String _calculateBase({required double bodyWeight}) {
    bool isOz =
        context.read<AppDataCubit>().state.data.volumeUnitType ==
        VolumeUnitType.ounces;
    double base = bodyWeight * DataDefault.bodyWeightMultiplier;
    if (isOz) {
      base = UnitConverter.mlToOz(base);
    }
    return base.toStringAsFixed(0);
  }

  String _calculateExercise({required double exerciseTime}) {
    bool isOz =
        context.read<AppDataCubit>().state.data.volumeUnitType ==
        VolumeUnitType.ounces;
    double exercise = exerciseTime * DataDefault.exerciseTimeMultiplier;
    if (isOz) {
      exercise = UnitConverter.mlToOz(exercise);
    }
    return exercise.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppDataCubit, AppDataState>(
      listenWhen: (previous, current) => current is UpdateVolumeUnitType,
      listener: (context, state) {
        bodyWeightTextController.clear();
        baseTextController.text = '0';
        excerciseTimeNotifier.value = 0.0;
      },
      child: CustomCardWidget(
        child: Column(
          spacing: AppDimens.padding12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildInfo(context),
            _buildFeature(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(BuildContext context) {
    return Column(
      spacing: AppDimens.padding12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MARK: Body Weight
        Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding4),
          child: Text(
            context.loc.body_weight,
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              fontWeight: FontWeight.bold,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        ),
        Row(
          spacing: AppDimens.padding12,
          children: [
            Expanded(
              child: BlocBuilder<AppDataCubit, AppDataState>(
                builder: (context, state) {
                  final weightUnit = state.data.weightUnitType;
                  return TextFormFieldWidget(
                    controller: bodyWeightTextController,
                    isDigitsOnly: true,
                    onTapOutside: () {
                      double bodyWeight =
                          double.tryParse(bodyWeightTextController.text) ?? 0;
                      if (weightUnit == WeightUnitType.pounds) {
                        bodyWeight /= DataDefault.kgPerLb;
                      }
                      _calculateResult(
                        bodyWeight: bodyWeight,
                        excerciseTime: excerciseTimeNotifier.value,
                      );
                      baseTextController.text = _calculateBase(
                        bodyWeight: bodyWeight,
                      );
                    },
                  );
                },
              ),
            ),
            BlocBuilder<AppDataCubit, AppDataState>(
              buildWhen: (previous, current) => current is UpdateWeightUnitType,
              builder: (context, state) {
                final weightUnit = state.data.weightUnitType;
                return SegmentedButtonWidget(
                  values: [
                    WeightUnitType.kilograms.rawValue,
                    WeightUnitType.pounds.rawValue,
                  ],
                  selected: {weightUnit.rawValue},
                  onSelectionChanged: (newSelected) {
                    double bodyWeight =
                        double.tryParse(bodyWeightTextController.text) ?? 0;
                    if (WeightUnitTypeExtension.fromRawValue(
                          newSelected.first,
                        ) ==
                        WeightUnitType.pounds) {
                      bodyWeight /= DataDefault.kgPerLb;
                    }
                    _calculateResult(
                      bodyWeight: bodyWeight,
                      excerciseTime: excerciseTimeNotifier.value,
                    );
                    baseTextController.text = _calculateBase(
                      bodyWeight: bodyWeight,
                    );
                    context.read<AppDataCubit>().updateWeightUnitType(
                      WeightUnitTypeExtension.fromRawValue(newSelected.first),
                    );
                  },
                );
              },
            ),
          ],
        ),

        // MARK: Excercise Time
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.padding4),
              child: Text(
                context.loc.daily_exercise_time,
                style: TextStyle(
                  fontSize: AppDimens.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getWhiteBlack(context),
                ),
              ),
            ),
            BlocBuilder<AppDataCubit, AppDataState>(
              builder: (context, state) {
                final weightUnit = state.data.weightUnitType;
                return ValueListenableBuilder(
                  valueListenable: excerciseTimeNotifier,
                  builder: (context, value, child) {
                    return SliderWidget(
                      max: 180,
                      unit: 'min',
                      divisions: 12,
                      value: value,
                      onChangeEnd: (newValue) {
                        double bodyWeight =
                            double.tryParse(bodyWeightTextController.text) ?? 0;
                        if (weightUnit == WeightUnitType.pounds) {
                          bodyWeight /= DataDefault.kgPerLb;
                        }
                        _calculateResult(
                          bodyWeight: bodyWeight,
                          excerciseTime: newValue,
                        );
                        excerciseTimeNotifier.value = newValue;
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),

        // MARK: Recommendation
        Container(
          padding: const EdgeInsets.all(AppDimens.padding16),
          decoration: BoxDecoration(
            color: AppColor.getTipCardColor(context),
            borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
          ),
          child: Column(
            children: [
              if (MediaQuery.of(context).size.width <= 360)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.loc.recommended_daily_intake,
                        style: TextStyle(
                          fontSize: AppDimens.fontSizeDefault,
                          fontWeight: FontWeight.bold,
                          color: AppColor.getWhiteBlack(context),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    BlocBuilder<
                      HydrationCalculatorCubit,
                      HydrationCalculatorState
                    >(
                      builder: (context, state) {
                        return Text(
                          state.data.calculationResult.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: AppDimens.fontSize20,
                            color: AppColor.getBlueCyanColor(context),
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.loc.recommended_daily_intake,
                      style: TextStyle(
                        fontSize: AppDimens.fontSizeDefault,
                        fontWeight: FontWeight.bold,
                        color: AppColor.getWhiteBlack(context),
                      ),
                    ),
                    BlocBuilder<
                      HydrationCalculatorCubit,
                      HydrationCalculatorState
                    >(
                      builder: (context, state) {
                        return Text(
                          state.data.calculationResult.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: AppDimens.fontSize20,
                            color: AppColor.getBlueCyanColor(context),
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                ),

              const SizedBox(height: AppDimens.padding8),
              ValueListenableBuilder(
                valueListenable: baseTextController,
                builder: (context, value, child) {
                  return _buildListItem(
                    context,
                    text: context.loc.base(value.text.isEmpty ? 0 : value.text),
                  );
                },
              ),
              const SizedBox(height: AppDimens.padding4),
              ValueListenableBuilder(
                valueListenable: excerciseTimeNotifier,
                builder: (context, value, child) {
                  return _buildListItem(
                    context,
                    text: context.loc.exercise(
                      _calculateExercise(exerciseTime: value),
                      value.toStringAsFixed(0),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        // MARK: Apply Button
        Builder(
          builder: (context) {
            final hydrationCalculatorState = context
                .watch<HydrationCalculatorCubit>();
            final appDataCubit = context.watch<AppDataCubit>();
            final calculationResult =
                hydrationCalculatorState.state.data.calculationResult;
            final advancedModeStatus =
                appDataCubit.state.data.advancedModeStatus;

            final unit = appDataCubit.state.data.volumeUnitType.rawValue;
            bool isOz =
                appDataCubit.state.data.volumeUnitType == VolumeUnitType.ounces;

            double minDailyGoal = DataDefault.minDailyGoal;
            double currentMaxDailyGoal = DataDefault.maxDailyGoal;
            if (advancedModeStatus) {
              currentMaxDailyGoal = DataDefault.advancedxDailyGoal;
            }

            if (isOz) {
              minDailyGoal = UnitConverter.mlToOz(minDailyGoal);
              currentMaxDailyGoal = UnitConverter.mlToOz(currentMaxDailyGoal);
            }

            return SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (calculationResult >= minDailyGoal &&
                      calculationResult <= currentMaxDailyGoal) {
                    showDialog(
                      context: context,
                      builder: (context) => DialogWidget(
                        title: context.loc.apply_recommended_goal,
                        body: Padding(
                          padding: const EdgeInsets.only(
                            top: AppDimens.padding16,
                          ),
                          child: Text(
                            context.loc.apply_recommended_goal_success_dialog(
                              calculationResult.toStringAsFixed(0),
                              unit,
                            ),
                            style: TextStyle(
                              fontSize: AppDimens.fontSizeDefault,
                              color: AppColor.getWhiteBlack(context),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ).then((value) {
                      if (!context.mounted) return;
                      if (value) {
                        context.read<AppDataCubit>().updateDailyGoal(
                          value: calculationResult,
                        );
                      }
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => InfoDialogWidget(
                        title: context.loc.invalid_goal_amount,
                        content: context.loc
                            .apply_recommended_goal_failure_dialog(
                              minDailyGoal.toStringAsFixed(0),
                              currentMaxDailyGoal.toStringAsFixed(0),
                              unit,
                            ),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.getBlueCyanColor(context),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding16,
                    vertical: AppDimens.padding16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.borderRadius4,
                    ),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                ),
                child: Text(
                  context.loc.apply_recommended_goal,
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeDefault,
                    fontWeight: FontWeight.bold,
                    color: AppColor.getWhiteBlack(context, reverse: true),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, {required String text}) => Row(
    spacing: AppDimens.padding8,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: AppDimens.padding4),
        child: Icon(
          Icons.circle,
          size: 8.0,
          color: AppColor.getWhiteBlack(context),
        ),
      ),
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: AppDimens.fontSizeDefault,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ),
    ],
  );

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: AppDimens.padding12,
      children: [
        SvgPicture.asset(
          ImageConstant.drop,
          colorFilter: ColorFilter.mode(
            AppColor.getGreyColorForText(context),
            BlendMode.srcIn,
          ),
          height: AppDimens.iconSize20,
        ),
        Text(
          context.loc.hydration_calculator,
          style: TextStyle(
            fontSize: AppDimens.fontSize16,
            fontWeight: FontWeight.bold,
            color: AppColor.getWhiteBlack(context),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Text(
      context.loc.hydration_calculator_description,
      style: TextStyle(
        fontSize: AppDimens.fontSizeDefault,
        color: AppColor.getContentColor(context),
      ),
    );
  }
}
