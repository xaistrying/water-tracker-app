// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:awesome_notifications/awesome_notifications.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/time_of_day_extension.dart';
import '../constant/app_strings.dart';
import '../constant/data_default.dart';
import '../di/injector.dart';
import '../theme/app_color.dart';
import '../theme/app_dimens.dart';
import '../widget/dialog_widget.dart';

class NotificationService {
  final _awesomeNotifications = getIt<AwesomeNotifications>();

  Future<void> initNotification() async {
    await _awesomeNotifications.initialize(null, [
      NotificationChannel(
        channelKey: AppStrings.scheduleChannelKey,
        channelName: AppStrings.scheduleChannelName,
        channelDescription: AppStrings.scheduleChannelDescription,
        importance: NotificationImportance.Default,
        channelShowBadge: true,
      ),
    ]);
  }

  Future<void> cancelScheduledNotification() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  Future<void> createScheduledNotification({
    required String title,
    required String body,
    String? iconPath,
    NotificationLayout layout = NotificationLayout.Inbox,
    DateTime? startTime,
    DateTime? endTime,
    int? interval,
  }) async {
    String localTimeZone = await _awesomeNotifications
        .getLocalTimeZoneIdentifier();

    startTime = startTime ?? DataDefault.startTime.toDateTime();
    endTime = endTime ?? DataDefault.endTime.toDateTime();
    interval = interval ?? DataDefault.notificationInterval;

    for (
      DateTime time = startTime;
      time.isBefore(endTime) || time.isAtSameMomentAs(endTime);
      time = time.add(Duration(minutes: interval))
    ) {
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: _createUniqueId(),
          channelKey: AppStrings.scheduleChannelKey,
          title: title,
          body: body,
          bigPicture: iconPath,
          notificationLayout: layout,
          category: NotificationCategory.Reminder,
        ),
        schedule: NotificationCalendar(
          year: time.year,
          month: time.month,
          day: time.day,
          hour: time.hour,
          minute: time.minute,
          second: 0,
          millisecond: 0,
          timeZone: localTimeZone,
        ),
      );
    }
  }

  Future<bool> requestNotificationIfNeeded(BuildContext context) async {
    final isAllowed = await _awesomeNotifications.isNotificationAllowed();

    if (!context.mounted) return false;

    if (isAllowed) {
      return true;
    }

    bool permissionGranted = false;

    await showDialog(
      context: context,
      builder: (context) => DialogWidget(
        title: 'Allow Notifications',
        body: Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding16),
          child: Text(
            'Enable notifications to get regular reminders to drink water '
            'and stay hydrated.',
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              color: AppColor.getWhiteBlack(context),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        buttonName: 'Allow',
        buttonFunc: () async {
          permissionGranted = await _awesomeNotifications
              .requestPermissionToSendNotifications();
        },
        cancelButtonName: 'Don\'t Allow',
      ),
    );

    return permissionGranted;
  }

  int _createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }
}
