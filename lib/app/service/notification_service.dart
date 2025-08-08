// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';
import 'package:water_tracker_app/app/extension/time_of_day_extension.dart';
import '../constant/app_strings.dart';
import '../constant/data_default.dart';
import '../theme/app_color.dart';
import '../theme/app_dimens.dart';
import '../widget/dialog_widget.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  final bool _isInitialize = false;

  bool get isInitialize => _isInitialize;

  Future<void> initNotification() async {
    if (_isInitialize) return;

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const initSettingsAndroid = AndroidInitializationSettings(
      '@drawable/drink_log_noti_icon',
    );

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
  }

  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }

  Future<void> createScheduledNotification({
    required String title,
    required String body,
    DateTime? startTime,
    DateTime? endTime,
    int? interval,
    bool silent = false,
  }) async {
    startTime = startTime ?? DataDefault.startTime.toDateTime();
    endTime = endTime ?? DataDefault.endTime.toDateTime();
    interval = interval ?? DataDefault.notificationInterval;

    final now = DateTime.now();
    startTime = DateTime(
      now.year,
      now.month,
      now.day,
      startTime.hour,
      startTime.minute,
    );
    endTime = DateTime(
      now.year,
      now.month,
      now.day,
      endTime.hour,
      endTime.minute,
    );

    await cancelAllNotifications();

    for (
      DateTime time = startTime;
      time.isBefore(endTime) || time.isAtSameMomentAs(endTime);
      time = time.add(Duration(minutes: interval))
    ) {
      DateTime scheduledTime = time;
      if (scheduledTime.isBefore(DateTime.now())) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }
      var scheduledDate = tz.TZDateTime(
        tz.local,
        scheduledTime.year,
        scheduledTime.month,
        scheduledTime.day,
        scheduledTime.hour,
        scheduledTime.minute,
        0,
      );
      await notificationPlugin.zonedSchedule(
        scheduledTime.toIso8601String().hashCode,
        title,
        body,
        scheduledDate,
        silent ? silentNotificationDetails() : notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('Scheduled Notification Created at $scheduledDate');
    }
  }

  Future<bool> checkIsNotificationAllowed() async {
    final bool? isGrantedAndroid = await notificationPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.areNotificationsEnabled();
    return isGrantedAndroid ?? false;
  }

  Future<bool> requestNotificationIfNeeded(BuildContext context) async {
    final isAllowed = await checkIsNotificationAllowed();

    if (!context.mounted) return false;

    if (isAllowed) {
      return true;
    }

    bool permissionGranted = false;

    await showDialog(
      context: context,
      builder: (context) => DialogWidget(
        title: context.loc.allow_notification,
        body: Padding(
          padding: const EdgeInsets.only(top: AppDimens.padding16),
          child: Text(
            context.loc.allow_notification_dialog,
            style: TextStyle(
              fontSize: AppDimens.fontSizeDefault,
              color: AppColor.getWhiteBlack(context),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        buttonName: context.loc.allow,
        buttonFunc: () async {
          final ispermanetelydenied =
              await Permission.notification.isPermanentlyDenied;
          if (ispermanetelydenied) {
            await openAppSettings();
          } else {
            final requestPermission = await Permission.notification.request();
            permissionGranted = requestPermission == PermissionStatus.granted;
          }
        },
        cancelButtonName: context.loc.close,
      ),
    );

    return permissionGranted;
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        AppStrings.scheduleChannelKey,
        AppStrings.scheduleChannelName,
        channelDescription: AppStrings.scheduleChannelDescription,
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }

  NotificationDetails silentNotificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        AppStrings.scheduleSilentChannelKey,
        AppStrings.scheduleSilentChannelName,
        channelDescription: AppStrings.scheduleSilentChannelDescription,
        importance: Importance.high,
        priority: Priority.high,
        playSound: false,
        enableVibration: false,
      ),
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    return notificationPlugin.show(0, title, body, notificationDetails());
  }
}
