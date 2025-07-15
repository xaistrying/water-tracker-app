// Project imports:
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';

abstract class ReminderDataSource {
  // Reminder Status
  Future<void> cacheReminderStatus({required bool status});
  bool? getReminderStatus();

  // Sound Effect Status
  Future<void> cacheSoundEffectStatus({required bool status});
  bool? getSoundEffectStatus();

  // Reminder Interval
  Future<void> cacheReminderInterval({required double value});
  double? getReminderInterval();

  // Start and End Time
  Future<void> cacheStartTime({required String value});
  String? getStartTime();
  Future<void> cacheEndTime({required String value});
  String? getEndTime();
}

class ReminderDataSourceImpl implements ReminderDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const reminderStatusKey = 'REMINDER_STATUS_KEY';
  static const soundEffectStatusKey = 'SOUND_EFFECT_STATUS_KEY';
  static const reminderIntervalKey = 'REMINDER_INTERVAL_KEY';
  static const startTimeKey = 'START_TIME_KEY';
  static const endTimeKey = 'END_TIME_KEY';

  @override
  Future<void> cacheReminderStatus({required bool status}) async {
    await _pref.setValue<bool>(reminderStatusKey, status);
  }

  @override
  bool? getReminderStatus() {
    return _pref.getValue<bool>(reminderStatusKey);
  }

  @override
  Future<void> cacheSoundEffectStatus({required bool status}) async {
    await _pref.setValue<bool>(soundEffectStatusKey, status);
  }

  @override
  bool? getSoundEffectStatus() {
    return _pref.getValue<bool>(soundEffectStatusKey);
  }

  @override
  Future<void> cacheReminderInterval({required double value}) async {
    await _pref.setValue<double>(reminderIntervalKey, value);
  }

  @override
  double? getReminderInterval() {
    return _pref.getValue<double>(reminderIntervalKey);
  }

  @override
  Future<void> cacheStartTime({required String value}) async {
    await _pref.setValue<String>(startTimeKey, value);
  }

  @override
  String? getStartTime() {
    return _pref.getValue<String>(startTimeKey);
  }

  @override
  Future<void> cacheEndTime({required String value}) async {
    await _pref.setValue<String>(endTimeKey, value);
  }

  @override
  String? getEndTime() {
    return _pref.getValue<String>(endTimeKey);
  }
}
