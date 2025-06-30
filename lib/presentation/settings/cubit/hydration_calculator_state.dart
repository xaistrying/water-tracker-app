part of 'hydration_calculator_cubit.dart';

@freezed
abstract class HydrationCalculatorStateData
    with _$HydrationCalculatorStateData {
  const factory HydrationCalculatorStateData({
    @Default(0) double calculationResult,
  }) = _HydrationCalculatorStateData;
}

@freezed
abstract class HydrationCalculatorState with _$HydrationCalculatorState {
  const factory HydrationCalculatorState.initialState(
    HydrationCalculatorStateData data,
  ) = _InitialState;
  const factory HydrationCalculatorState.updateCalculationResult(
    HydrationCalculatorStateData data,
  ) = UpdateCalculationResult;
}
