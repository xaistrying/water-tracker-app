// Project imports:
import 'package:water_tracker_app/app/di/injector.dart';
import 'package:water_tracker_app/app/service/app_prefs_service.dart';

abstract class ProfileDataSource {
  Future<void> cacheUserName({required String userName});
  String getUserName();
  Future<void> cacheAdvancedModeStatus({required bool status});
  bool? getAdvancedModeStatus();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const profileKey = 'PROFILE_KEY';
  static const advancedModeKey = 'ADVANCED_MODE_KEY';

  @override
  Future<void> cacheUserName({required String userName}) async {
    await _pref.setValue<String>(profileKey, userName);
  }

  @override
  String getUserName() {
    return _pref.getValue<String>(profileKey) ?? '';
  }

  @override
  Future<void> cacheAdvancedModeStatus({required bool status}) async {
    await _pref.setValue<bool>(advancedModeKey, status);
  }

  @override
  bool? getAdvancedModeStatus() {
    return _pref.getValue<bool>(advancedModeKey);
  }
}
