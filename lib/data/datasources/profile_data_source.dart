// Project imports:
import 'package:water_tracker_app/app/di/injector.dart';
import 'package:water_tracker_app/app/service/app_prefs_service.dart';

abstract class ProfileDataSource {
  Future<void> cacheUserName({required String userName});
  String getUserName();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const profileKey = 'PROFILE_KEY';

  @override
  Future<void> cacheUserName({required String userName}) async {
    await _pref.setValue(profileKey, userName);
  }

  @override
  String getUserName() {
    return _pref.getValue(profileKey);
  }
}
