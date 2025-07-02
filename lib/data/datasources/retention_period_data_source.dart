// Project imports:
import 'package:water_tracker_app/app/enum/retention_period.dart';
import '../../app/di/injector.dart';
import '../../app/service/app_prefs_service.dart';

abstract class RetentionPeriodDataSource {
  Future<void> cacheRetentionPeriodValue({
    required RetentionPeriod retentionPeriod,
  });
  RetentionPeriod getRetentionPeriodValue();
}

class RetentionPeriodDataSourceImpl implements RetentionPeriodDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const retentionPeriodKey = 'RETENTION_PERIOD_KEY';

  @override
  Future<void> cacheRetentionPeriodValue({
    required RetentionPeriod retentionPeriod,
  }) async {
    await _pref.setValue<String>(retentionPeriodKey, retentionPeriod.rawValue);
  }

  @override
  RetentionPeriod getRetentionPeriodValue() {
    final res = _pref.getValue<String>(retentionPeriodKey);
    return RetentionPeriodExtension.fromRawValue(res ?? '');
  }
}
