// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/widget/dialog_widget.dart';
import '../../../app/widget/text_form_field_widget.dart';

class QuickAddCustomDialog extends StatelessWidget {
  const QuickAddCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
          TextFormFieldWidget(isDense: false, isDigitsOnly: true),
        ],
      ),
      buttonName: 'Add Water',
      buttonFunc: () {},
    );
  }
}
