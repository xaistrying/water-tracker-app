// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class SegmentedButtonWidget extends StatelessWidget {
  const SegmentedButtonWidget({
    super.key,
    required this.values,
    this.onSelectionChanged,
    required this.selected,
  });

  final List<String> values;
  final Function(Set<String>)? onSelectionChanged;
  final Set<String> selected;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: values.map((value) {
        String text = '';
        switch (value) {
          case '1 Day':
            text = '1 ${context.loc.day}';
            break;
          case '1 Week':
            text = '1 ${context.loc.week}';
            break;
          case '1 Month':
            text = '1 ${context.loc.month}';
            break;
          default:
            text = value;
        }
        return ButtonSegment(
          value: value,
          label: Text(
            text,
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              color: AppColor.getWhiteBlack(context),
            ),
          ),
        );
      }).toList(),
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
        padding: EdgeInsets.zero,
        selectedBackgroundColor: AppColor.getSelectedSegmentedButtonColor(
          context,
        ),
        splashFactory: NoSplash.splashFactory,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
        ),
        side: BorderSide(
          color: AppColor.getTextFieldBorderColor(context),
          width: AppDimens.borderWidth1,
        ),
      ),
    );
  }
}
