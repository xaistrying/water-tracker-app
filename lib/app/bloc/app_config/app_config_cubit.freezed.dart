// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppConfigStateData {

 Locale? get locale; ThemeMode? get themeMode; UnitType get volumeUnitType; UnitType get weightUnitType;
/// Create a copy of AppConfigStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<AppConfigStateData> get copyWith => _$AppConfigStateDataCopyWithImpl<AppConfigStateData>(this as AppConfigStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigStateData&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType));
}


@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,volumeUnitType,weightUnitType);

@override
String toString() {
  return 'AppConfigStateData(locale: $locale, themeMode: $themeMode, volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType)';
}


}

/// @nodoc
abstract mixin class $AppConfigStateDataCopyWith<$Res>  {
  factory $AppConfigStateDataCopyWith(AppConfigStateData value, $Res Function(AppConfigStateData) _then) = _$AppConfigStateDataCopyWithImpl;
@useResult
$Res call({
 Locale? locale, ThemeMode? themeMode, UnitType volumeUnitType, UnitType weightUnitType
});




}
/// @nodoc
class _$AppConfigStateDataCopyWithImpl<$Res>
    implements $AppConfigStateDataCopyWith<$Res> {
  _$AppConfigStateDataCopyWithImpl(this._self, this._then);

  final AppConfigStateData _self;
  final $Res Function(AppConfigStateData) _then;

/// Create a copy of AppConfigStateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,Object? themeMode = freezed,Object? volumeUnitType = null,Object? weightUnitType = null,}) {
  return _then(_self.copyWith(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,themeMode: freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode?,volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as UnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as UnitType,
  ));
}

}


/// @nodoc


class _AppConfigStateData implements AppConfigStateData {
  const _AppConfigStateData({this.locale, this.themeMode = ThemeMode.system, this.volumeUnitType = UnitType.milliliters, this.weightUnitType = UnitType.kilograms});
  

@override final  Locale? locale;
@override@JsonKey() final  ThemeMode? themeMode;
@override@JsonKey() final  UnitType volumeUnitType;
@override@JsonKey() final  UnitType weightUnitType;

/// Create a copy of AppConfigStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigStateDataCopyWith<_AppConfigStateData> get copyWith => __$AppConfigStateDataCopyWithImpl<_AppConfigStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigStateData&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType));
}


@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,volumeUnitType,weightUnitType);

@override
String toString() {
  return 'AppConfigStateData(locale: $locale, themeMode: $themeMode, volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType)';
}


}

/// @nodoc
abstract mixin class _$AppConfigStateDataCopyWith<$Res> implements $AppConfigStateDataCopyWith<$Res> {
  factory _$AppConfigStateDataCopyWith(_AppConfigStateData value, $Res Function(_AppConfigStateData) _then) = __$AppConfigStateDataCopyWithImpl;
@override @useResult
$Res call({
 Locale? locale, ThemeMode? themeMode, UnitType volumeUnitType, UnitType weightUnitType
});




}
/// @nodoc
class __$AppConfigStateDataCopyWithImpl<$Res>
    implements _$AppConfigStateDataCopyWith<$Res> {
  __$AppConfigStateDataCopyWithImpl(this._self, this._then);

  final _AppConfigStateData _self;
  final $Res Function(_AppConfigStateData) _then;

/// Create a copy of AppConfigStateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,Object? themeMode = freezed,Object? volumeUnitType = null,Object? weightUnitType = null,}) {
  return _then(_AppConfigStateData(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale?,themeMode: freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode?,volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as UnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as UnitType,
  ));
}


}

/// @nodoc
mixin _$AppConfigState {

 AppConfigStateData get data;
/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigStateCopyWith<AppConfigState> get copyWith => _$AppConfigStateCopyWithImpl<AppConfigState>(this as AppConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppConfigStateCopyWith<$Res>  {
  factory $AppConfigStateCopyWith(AppConfigState value, $Res Function(AppConfigState) _then) = _$AppConfigStateCopyWithImpl;
@useResult
$Res call({
 AppConfigStateData data
});


$AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AppConfigStateCopyWithImpl<$Res>
    implements $AppConfigStateCopyWith<$Res> {
  _$AppConfigStateCopyWithImpl(this._self, this._then);

  final AppConfigState _self;
  final $Res Function(AppConfigState) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}
/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc


class _InitialState implements AppConfigState {
  const _InitialState(this.data);
  

@override final  AppConfigStateData data;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialStateCopyWith<_InitialState> get copyWith => __$InitialStateCopyWithImpl<_InitialState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState.initialState(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InitialStateCopyWith<$Res> implements $AppConfigStateCopyWith<$Res> {
  factory _$InitialStateCopyWith(_InitialState value, $Res Function(_InitialState) _then) = __$InitialStateCopyWithImpl;
@override @useResult
$Res call({
 AppConfigStateData data
});


@override $AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class __$InitialStateCopyWithImpl<$Res>
    implements _$InitialStateCopyWith<$Res> {
  __$InitialStateCopyWithImpl(this._self, this._then);

  final _InitialState _self;
  final $Res Function(_InitialState) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_InitialState(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateLocaleState implements AppConfigState {
  const UpdateLocaleState(this.data);
  

@override final  AppConfigStateData data;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocaleStateCopyWith<UpdateLocaleState> get copyWith => _$UpdateLocaleStateCopyWithImpl<UpdateLocaleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocaleState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState.updateLocaleState(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateLocaleStateCopyWith<$Res> implements $AppConfigStateCopyWith<$Res> {
  factory $UpdateLocaleStateCopyWith(UpdateLocaleState value, $Res Function(UpdateLocaleState) _then) = _$UpdateLocaleStateCopyWithImpl;
@override @useResult
$Res call({
 AppConfigStateData data
});


@override $AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateLocaleStateCopyWithImpl<$Res>
    implements $UpdateLocaleStateCopyWith<$Res> {
  _$UpdateLocaleStateCopyWithImpl(this._self, this._then);

  final UpdateLocaleState _self;
  final $Res Function(UpdateLocaleState) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateLocaleState(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateThemeMode implements AppConfigState {
  const UpdateThemeMode(this.data);
  

@override final  AppConfigStateData data;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateThemeModeCopyWith<UpdateThemeMode> get copyWith => _$UpdateThemeModeCopyWithImpl<UpdateThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateThemeMode&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState.updateThemeMode(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateThemeModeCopyWith<$Res> implements $AppConfigStateCopyWith<$Res> {
  factory $UpdateThemeModeCopyWith(UpdateThemeMode value, $Res Function(UpdateThemeMode) _then) = _$UpdateThemeModeCopyWithImpl;
@override @useResult
$Res call({
 AppConfigStateData data
});


@override $AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateThemeModeCopyWithImpl<$Res>
    implements $UpdateThemeModeCopyWith<$Res> {
  _$UpdateThemeModeCopyWithImpl(this._self, this._then);

  final UpdateThemeMode _self;
  final $Res Function(UpdateThemeMode) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateThemeMode(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateVolumeUnitType implements AppConfigState {
  const UpdateVolumeUnitType(this.data);
  

@override final  AppConfigStateData data;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateVolumeUnitTypeCopyWith<UpdateVolumeUnitType> get copyWith => _$UpdateVolumeUnitTypeCopyWithImpl<UpdateVolumeUnitType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateVolumeUnitType&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState.updateVolumeUnitType(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateVolumeUnitTypeCopyWith<$Res> implements $AppConfigStateCopyWith<$Res> {
  factory $UpdateVolumeUnitTypeCopyWith(UpdateVolumeUnitType value, $Res Function(UpdateVolumeUnitType) _then) = _$UpdateVolumeUnitTypeCopyWithImpl;
@override @useResult
$Res call({
 AppConfigStateData data
});


@override $AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateVolumeUnitTypeCopyWithImpl<$Res>
    implements $UpdateVolumeUnitTypeCopyWith<$Res> {
  _$UpdateVolumeUnitTypeCopyWithImpl(this._self, this._then);

  final UpdateVolumeUnitType _self;
  final $Res Function(UpdateVolumeUnitType) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateVolumeUnitType(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateWeightUnitType implements AppConfigState {
  const UpdateWeightUnitType(this.data);
  

@override final  AppConfigStateData data;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWeightUnitTypeCopyWith<UpdateWeightUnitType> get copyWith => _$UpdateWeightUnitTypeCopyWithImpl<UpdateWeightUnitType>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWeightUnitType&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppConfigState.updateWeightUnitType(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateWeightUnitTypeCopyWith<$Res> implements $AppConfigStateCopyWith<$Res> {
  factory $UpdateWeightUnitTypeCopyWith(UpdateWeightUnitType value, $Res Function(UpdateWeightUnitType) _then) = _$UpdateWeightUnitTypeCopyWithImpl;
@override @useResult
$Res call({
 AppConfigStateData data
});


@override $AppConfigStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateWeightUnitTypeCopyWithImpl<$Res>
    implements $UpdateWeightUnitTypeCopyWith<$Res> {
  _$UpdateWeightUnitTypeCopyWithImpl(this._self, this._then);

  final UpdateWeightUnitType _self;
  final $Res Function(UpdateWeightUnitType) _then;

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateWeightUnitType(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppConfigStateData,
  ));
}

/// Create a copy of AppConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigStateDataCopyWith<$Res> get data {
  
  return $AppConfigStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
