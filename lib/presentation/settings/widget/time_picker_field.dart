// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class TimePickerField extends StatelessWidget {
  const TimePickerField({
    super.key,
    required this.controller,
    required this.initialTime,
  });

  final TextEditingController controller;
  final TimeOfDay initialTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final time = await _showCustomTimePicker(
          context,
          initalTime: initialTime,
        );
        if (time != null) {
          controller.text = DateFormat(
            'hh:mm a',
          ).format(_convertTimeOfDayToDateTime(time));
        }
      },
      child: Container(
        padding: EdgeInsets.all(AppDimens.padding12),
        decoration: BoxDecoration(
          color: AppColor.getInputFieldColor(context),
          border: BoxBorder.all(color: AppColor.getGreyColorForText(context)),
          borderRadius: BorderRadius.circular(AppDimens.borderRadius4),
        ),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    value.text,
                    style: TextStyle(
                      fontSize: AppDimens.fontSizeDefault,
                      color: AppColor.getWhiteBlack(context),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<TimeOfDay?> _showCustomTimePicker(
  BuildContext context, {
  required TimeOfDay initalTime,
}) async {
  return await showTimePicker(
    context: context,
    initialTime: initalTime,
    initialEntryMode: TimePickerEntryMode.dialOnly,
    orientation: Orientation.portrait,
    builder: (BuildContext context, Widget? child) {
      return Localizations.override(
        context: context,
        locale: Locale('en', ''), // forces 12 hour format
        delegates: [const CustomLocalizationsDelegate()],
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme(
                surface: AppColor.getDialogColor(context),
                primary: AppColor.getBlueCyanColor(context),
                onSurface: AppColor.getWhiteBlack(context),
                secondary: AppColor.getSelectedSegmentedButtonColor(context),
                onSecondary: AppColor.getWhiteBlack(context),
                onPrimary: AppColor.getWhiteBlack(context, reverse: true),
                brightness: Theme.of(context).brightness,
                error: AppColor.getWhiteBlack(context),
                onError: Theme.of(context).colorScheme.onError,
              ),

              timePickerTheme: TimePickerThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
                ),
                dialBackgroundColor: AppColor.getDialBackgroundColor(context),
                helpTextStyle: TextStyle(
                  color: AppColor.getWhiteBlack(context),
                ),
                hourMinuteColor: WidgetStateColor.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? AppColor.getBlueCyanColor(context)
                      : AppColor.getDialBackgroundColor(context),
                ),
              ),
            ),
            child: child ?? SizedBox.shrink(),
          ),
        ),
      );
    },
  );
}

class CustomLocalizations extends DefaultMaterialLocalizations {
  @override
  String get timePickerDialHelpText => 'Hi'; // custom text
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture(CustomLocalizations());
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}

DateTime _convertTimeOfDayToDateTime(TimeOfDay time) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, time.hour, time.minute);
}
