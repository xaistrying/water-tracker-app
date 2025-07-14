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
}

class ReminderDataSourceImpl implements ReminderDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const reminderStatusKey = 'REMINDER_STATUS_KEY';
  static const soundEffectStatusKey = 'SOUND_EFFECT_STATUS_KEY';

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
}
