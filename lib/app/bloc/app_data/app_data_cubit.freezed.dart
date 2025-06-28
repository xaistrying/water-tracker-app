// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppDataStateData {

 VolumeUnitType get volumeUnitType; WeightUnitType get weightUnitType; String get userName;
/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<AppDataStateData> get copyWith => _$AppDataStateDataCopyWithImpl<AppDataStateData>(this as AppDataStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDataStateData&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType)&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,volumeUnitType,weightUnitType,userName);

@override
String toString() {
  return 'AppDataStateData(volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $AppDataStateDataCopyWith<$Res>  {
  factory $AppDataStateDataCopyWith(AppDataStateData value, $Res Function(AppDataStateData) _then) = _$AppDataStateDataCopyWithImpl;
@useResult
$Res call({
 VolumeUnitType volumeUnitType, WeightUnitType weightUnitType, String userName
});




}
/// @nodoc
class _$AppDataStateDataCopyWithImpl<$Res>
    implements $AppDataStateDataCopyWith<$Res> {
  _$AppDataStateDataCopyWithImpl(this._self, this._then);

  final AppDataStateData _self;
  final $Res Function(AppDataStateData) _then;

/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? volumeUnitType = null,Object? weightUnitType = null,Object? userName = null,}) {
  return _then(_self.copyWith(
volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as VolumeUnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as WeightUnitType,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _AppDataStateData implements AppDataStateData {
  const _AppDataStateData({this.volumeUnitType = VolumeUnitType.milliliters, this.weightUnitType = WeightUnitType.kilograms, this.userName = ''});
  

@override@JsonKey() final  VolumeUnitType volumeUnitType;
@override@JsonKey() final  WeightUnitType weightUnitType;
@override@JsonKey() final  String userName;

/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppDataStateDataCopyWith<_AppDataStateData> get copyWith => __$AppDataStateDataCopyWithImpl<_AppDataStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppDataStateData&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType)&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,volumeUnitType,weightUnitType,userName);

@override
String toString() {
  return 'AppDataStateData(volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType, userName: $userName)';
}


}

/// @nodoc
abstract mixin class _$AppDataStateDataCopyWith<$Res> implements $AppDataStateDataCopyWith<$Res> {
  factory _$AppDataStateDataCopyWith(_AppDataStateData value, $Res Function(_AppDataStateData) _then) = __$AppDataStateDataCopyWithImpl;
@override @useResult
$Res call({
 VolumeUnitType volumeUnitType, WeightUnitType weightUnitType, String userName
});




}
/// @nodoc
class __$AppDataStateDataCopyWithImpl<$Res>
    implements _$AppDataStateDataCopyWith<$Res> {
  __$AppDataStateDataCopyWithImpl(this._self, this._then);

  final _AppDataStateData _self;
  final $Res Function(_AppDataStateData) _then;

/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? volumeUnitType = null,Object? weightUnitType = null,Object? userName = null,}) {
  return _then(_AppDataStateData(
volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as VolumeUnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as WeightUnitType,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AppDataState {

 AppDataStateData get data;
/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDataStateCopyWith<AppDataState> get copyWith => _$AppDataStateCopyWithImpl<AppDataState>(this as AppDataState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDataState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState(data: $data)';
}


}

/// @nodoc
abstract mixin class $AppDataStateCopyWith<$Res>  {
  factory $AppDataStateCopyWith(AppDataState value, $Res Function(AppDataState) _then) = _$AppDataStateCopyWithImpl;
@useResult
$Res call({
 AppDataStateData data
});


$AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AppDataStateCopyWithImpl<$Res>
    implements $AppDataStateCopyWith<$Res> {
  _$AppDataStateCopyWithImpl(this._self, this._then);

  final AppDataState _self;
  final $Res Function(AppDataState) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppDataStateData,
  ));
}
/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<$Res> get data {
  
  return $AppDataStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc


class _InitialState implements AppDataState {
  const _InitialState(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
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
  return 'AppDataState.initialState(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InitialStateCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory _$InitialStateCopyWith(_InitialState value, $Res Function(_InitialState) _then) = __$InitialStateCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class __$InitialStateCopyWithImpl<$Res>
    implements _$InitialStateCopyWith<$Res> {
  __$InitialStateCopyWithImpl(this._self, this._then);

  final _InitialState _self;
  final $Res Function(_InitialState) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_InitialState(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppDataStateData,
  ));
}

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<$Res> get data {
  
  return $AppDataStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateVolumeUnitType implements AppDataState {
  const UpdateVolumeUnitType(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
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
  return 'AppDataState.updateVolumeUnitType(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateVolumeUnitTypeCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateVolumeUnitTypeCopyWith(UpdateVolumeUnitType value, $Res Function(UpdateVolumeUnitType) _then) = _$UpdateVolumeUnitTypeCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateVolumeUnitTypeCopyWithImpl<$Res>
    implements $UpdateVolumeUnitTypeCopyWith<$Res> {
  _$UpdateVolumeUnitTypeCopyWithImpl(this._self, this._then);

  final UpdateVolumeUnitType _self;
  final $Res Function(UpdateVolumeUnitType) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateVolumeUnitType(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppDataStateData,
  ));
}

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<$Res> get data {
  
  return $AppDataStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateWeightUnitType implements AppDataState {
  const UpdateWeightUnitType(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
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
  return 'AppDataState.updateWeightUnitType(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateWeightUnitTypeCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateWeightUnitTypeCopyWith(UpdateWeightUnitType value, $Res Function(UpdateWeightUnitType) _then) = _$UpdateWeightUnitTypeCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateWeightUnitTypeCopyWithImpl<$Res>
    implements $UpdateWeightUnitTypeCopyWith<$Res> {
  _$UpdateWeightUnitTypeCopyWithImpl(this._self, this._then);

  final UpdateWeightUnitType _self;
  final $Res Function(UpdateWeightUnitType) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateWeightUnitType(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppDataStateData,
  ));
}

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<$Res> get data {
  
  return $AppDataStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class UpdateUserName implements AppDataState {
  const UpdateUserName(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserNameCopyWith<UpdateUserName> get copyWith => _$UpdateUserNameCopyWithImpl<UpdateUserName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserName&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateUserName(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateUserNameCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateUserNameCopyWith(UpdateUserName value, $Res Function(UpdateUserName) _then) = _$UpdateUserNameCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateUserNameCopyWithImpl<$Res>
    implements $UpdateUserNameCopyWith<$Res> {
  _$UpdateUserNameCopyWithImpl(this._self, this._then);

  final UpdateUserName _self;
  final $Res Function(UpdateUserName) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateUserName(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppDataStateData,
  ));
}

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<$Res> get data {
  
  return $AppDataStateDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
