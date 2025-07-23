// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  final bool _isInitialize = false;

  bool get isInitialize => _isInitialize;

  Future<void> initNotification() async {
    if (_isInitialize) return;

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const initSettingsAndroid = AndroidInitializationSettings(
      '@drawable/glass_cup',
    );

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    return notificationPlugin.show(0, title, body, notificationDetails());
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
  }) async {
    await cancelAllNotifications();
    final now = tz.TZDateTime.now(tz.local);

    final startTime = DateTime(now.year, now.month, now.day, 22, 30);
    final endTime = DateTime(now.year, now.month, now.day, 22, 40);
    final interval = 1;

    for (
      DateTime time = startTime;
      time.isBefore(endTime) || time.isAtSameMomentAs(endTime);
      time = time.add(Duration(minutes: interval))
    ) {
      if (time.isBefore(DateTime.now())) {
        continue;
      }
      var scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
        0,
      );
      await notificationPlugin.zonedSchedule(
        time.toIso8601String().hashCode,
        title,
        body,
        scheduledDate,
        notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }
}
