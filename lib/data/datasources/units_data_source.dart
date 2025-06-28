// Project imports:
import 'package:water_tracker_app/app/di/injector.dart';
import 'package:water_tracker_app/app/enum/unit_type.dart';
import 'package:water_tracker_app/app/service/app_prefs_service.dart';

abstract class UnitsDataSource {
  Future<void> cacheWeightUnitType({required WeightUnitType weightUnitType});
  WeightUnitType getWeightUnitType();
  Future<void> cacheVolumeUnitType({required VolumeUnitType volumeUnitType});
  VolumeUnitType getVolumeUnitType();
}

class UnitsDataSourceImpl implements UnitsDataSource {
  final _pref = getIt<AppPrefsServiceHelper>();

  static const weightUnitKey = 'WEIGHT_UNIT_KEY';
  static const volumeUnitKey = 'VOLUME_UNIT_KEY';

  @override
  Future<void> cacheWeightUnitType({
    required WeightUnitType weightUnitType,
  }) async {
    await _pref.setValue<String>(weightUnitKey, weightUnitType.rawValue);
  }

  @override
  WeightUnitType getWeightUnitType() {
    final res = _pref.getValue<String>(weightUnitKey);
    return WeightUnitTypeExtension.fromRawValue(res ?? '');
  }

  @override
  Future<void> cacheVolumeUnitType({
    required VolumeUnitType volumeUnitType,
  }) async {
    await _pref.setValue<String>(volumeUnitKey, volumeUnitType.rawValue);
  }

  @override
  VolumeUnitType getVolumeUnitType() {
    final res = _pref.getValue<String>(volumeUnitKey);
    return VolumeUnitTypeExtension.fromRawValue(res ?? '');
  }
}
