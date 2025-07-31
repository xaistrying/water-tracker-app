// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hydration_calculator_state.dart';
part 'hydration_calculator_cubit.freezed.dart';

class HydrationCalculatorCubit extends Cubit<HydrationCalculatorState> {
  HydrationCalculatorCubit()
    : super(const _InitialState(HydrationCalculatorStateData()));

  void updateCalculationResult(double calculationResult) {
    emit(
      UpdateCalculationResult(
        state.data.copyWith(calculationResult: calculationResult),
      ),
    );
  }
}
