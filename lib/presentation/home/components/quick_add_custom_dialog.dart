// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/dialog_widget.dart';
import '../../../app/widget/text_form_field_widget.dart';

class QuickAddCustomDialog extends StatefulWidget {
  const QuickAddCustomDialog({super.key});

  @override
  State<QuickAddCustomDialog> createState() => _QuickAddCustomDialogState();
}

class _QuickAddCustomDialogState extends State<QuickAddCustomDialog> {
  final customAmountTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    customAmountTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: customAmountTextController,
      builder: (context, value, child) {
        return DialogWidget(
          title: 'Add Custom Amount',
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimens.padding16,
                  bottom: AppDimens.padding8,
                ),
                child: Text(
                  'Amount (ml)',
                  style: TextStyle(
                    fontSize: AppDimens.fontSizeDefault,
                    fontWeight: FontWeight.bold,
                    color: AppColor.getWhiteBlack(context),
                  ),
                ),
              ),
              TextFormFieldWidget(
                isDense: false,
                isDigitsOnly: true,
                controller: customAmountTextController,
              ),
            ],
          ),
          buttonName: 'Add Water',
          buttonFunc: () {
            final intake = double.tryParse(value.text) ?? 0;
            context.read<AppDataCubit>().updateDailyIntake(value: intake);
          },
        );
      },
    );
  }
}
