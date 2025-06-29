// Project imports:
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';

abstract class QuickAddDataSource {
  Future<void> cacheSpecificQuickAddValue({
    required String option,
    required String value,
  });
  String getSpecificQuickAddValue({required String option});
}

class QuickAddDataSourceImpl implements QuickAddDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const quickAddKey = 'QUICK_ADD_KEY';

  @override
  Future<void> cacheSpecificQuickAddValue({
    required String option,
    required String value,
  }) async {
    await _pref.setValue<String>('$quickAddKey$option', value);
  }

  @override
  String getSpecificQuickAddValue({required String option}) {
    return _pref.getValue<String>('$quickAddKey$option') ?? '';
  }
}
