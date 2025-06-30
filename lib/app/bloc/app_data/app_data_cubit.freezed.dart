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

 VolumeUnitType get volumeUnitType; WeightUnitType get weightUnitType; String get userName; String get quickAddValue1; String get quickAddValue2; String get quickAddValue3; double get dailyGoal;
/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDataStateDataCopyWith<AppDataStateData> get copyWith => _$AppDataStateDataCopyWithImpl<AppDataStateData>(this as AppDataStateData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDataStateData&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.quickAddValue1, quickAddValue1) || other.quickAddValue1 == quickAddValue1)&&(identical(other.quickAddValue2, quickAddValue2) || other.quickAddValue2 == quickAddValue2)&&(identical(other.quickAddValue3, quickAddValue3) || other.quickAddValue3 == quickAddValue3)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal));
}


@override
int get hashCode => Object.hash(runtimeType,volumeUnitType,weightUnitType,userName,quickAddValue1,quickAddValue2,quickAddValue3,dailyGoal);

@override
String toString() {
  return 'AppDataStateData(volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType, userName: $userName, quickAddValue1: $quickAddValue1, quickAddValue2: $quickAddValue2, quickAddValue3: $quickAddValue3, dailyGoal: $dailyGoal)';
}


}

/// @nodoc
abstract mixin class $AppDataStateDataCopyWith<$Res>  {
  factory $AppDataStateDataCopyWith(AppDataStateData value, $Res Function(AppDataStateData) _then) = _$AppDataStateDataCopyWithImpl;
@useResult
$Res call({
 VolumeUnitType volumeUnitType, WeightUnitType weightUnitType, String userName, String quickAddValue1, String quickAddValue2, String quickAddValue3, double dailyGoal
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
@pragma('vm:prefer-inline') @override $Res call({Object? volumeUnitType = null,Object? weightUnitType = null,Object? userName = null,Object? quickAddValue1 = null,Object? quickAddValue2 = null,Object? quickAddValue3 = null,Object? dailyGoal = null,}) {
  return _then(_self.copyWith(
volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as VolumeUnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as WeightUnitType,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,quickAddValue1: null == quickAddValue1 ? _self.quickAddValue1 : quickAddValue1 // ignore: cast_nullable_to_non_nullable
as String,quickAddValue2: null == quickAddValue2 ? _self.quickAddValue2 : quickAddValue2 // ignore: cast_nullable_to_non_nullable
as String,quickAddValue3: null == quickAddValue3 ? _self.quickAddValue3 : quickAddValue3 // ignore: cast_nullable_to_non_nullable
as String,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _AppDataStateData implements AppDataStateData {
  const _AppDataStateData({this.volumeUnitType = VolumeUnitType.milliliters, this.weightUnitType = WeightUnitType.kilograms, this.userName = '', this.quickAddValue1 = '', this.quickAddValue2 = '', this.quickAddValue3 = '', this.dailyGoal = 0.0});
  

@override@JsonKey() final  VolumeUnitType volumeUnitType;
@override@JsonKey() final  WeightUnitType weightUnitType;
@override@JsonKey() final  String userName;
@override@JsonKey() final  String quickAddValue1;
@override@JsonKey() final  String quickAddValue2;
@override@JsonKey() final  String quickAddValue3;
@override@JsonKey() final  double dailyGoal;

/// Create a copy of AppDataStateData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppDataStateDataCopyWith<_AppDataStateData> get copyWith => __$AppDataStateDataCopyWithImpl<_AppDataStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppDataStateData&&(identical(other.volumeUnitType, volumeUnitType) || other.volumeUnitType == volumeUnitType)&&(identical(other.weightUnitType, weightUnitType) || other.weightUnitType == weightUnitType)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.quickAddValue1, quickAddValue1) || other.quickAddValue1 == quickAddValue1)&&(identical(other.quickAddValue2, quickAddValue2) || other.quickAddValue2 == quickAddValue2)&&(identical(other.quickAddValue3, quickAddValue3) || other.quickAddValue3 == quickAddValue3)&&(identical(other.dailyGoal, dailyGoal) || other.dailyGoal == dailyGoal));
}


@override
int get hashCode => Object.hash(runtimeType,volumeUnitType,weightUnitType,userName,quickAddValue1,quickAddValue2,quickAddValue3,dailyGoal);

@override
String toString() {
  return 'AppDataStateData(volumeUnitType: $volumeUnitType, weightUnitType: $weightUnitType, userName: $userName, quickAddValue1: $quickAddValue1, quickAddValue2: $quickAddValue2, quickAddValue3: $quickAddValue3, dailyGoal: $dailyGoal)';
}


}

/// @nodoc
abstract mixin class _$AppDataStateDataCopyWith<$Res> implements $AppDataStateDataCopyWith<$Res> {
  factory _$AppDataStateDataCopyWith(_AppDataStateData value, $Res Function(_AppDataStateData) _then) = __$AppDataStateDataCopyWithImpl;
@override @useResult
$Res call({
 VolumeUnitType volumeUnitType, WeightUnitType weightUnitType, String userName, String quickAddValue1, String quickAddValue2, String quickAddValue3, double dailyGoal
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
@override @pragma('vm:prefer-inline') $Res call({Object? volumeUnitType = null,Object? weightUnitType = null,Object? userName = null,Object? quickAddValue1 = null,Object? quickAddValue2 = null,Object? quickAddValue3 = null,Object? dailyGoal = null,}) {
  return _then(_AppDataStateData(
volumeUnitType: null == volumeUnitType ? _self.volumeUnitType : volumeUnitType // ignore: cast_nullable_to_non_nullable
as VolumeUnitType,weightUnitType: null == weightUnitType ? _self.weightUnitType : weightUnitType // ignore: cast_nullable_to_non_nullable
as WeightUnitType,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,quickAddValue1: null == quickAddValue1 ? _self.quickAddValue1 : quickAddValue1 // ignore: cast_nullable_to_non_nullable
as String,quickAddValue2: null == quickAddValue2 ? _self.quickAddValue2 : quickAddValue2 // ignore: cast_nullable_to_non_nullable
as String,quickAddValue3: null == quickAddValue3 ? _self.quickAddValue3 : quickAddValue3 // ignore: cast_nullable_to_non_nullable
as String,dailyGoal: null == dailyGoal ? _self.dailyGoal : dailyGoal // ignore: cast_nullable_to_non_nullable
as double,
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

/// @nodoc


class UpdateQuickAddValue1 implements AppDataState {
  const UpdateQuickAddValue1(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuickAddValue1CopyWith<UpdateQuickAddValue1> get copyWith => _$UpdateQuickAddValue1CopyWithImpl<UpdateQuickAddValue1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuickAddValue1&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateQuickAddValue1(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateQuickAddValue1CopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateQuickAddValue1CopyWith(UpdateQuickAddValue1 value, $Res Function(UpdateQuickAddValue1) _then) = _$UpdateQuickAddValue1CopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateQuickAddValue1CopyWithImpl<$Res>
    implements $UpdateQuickAddValue1CopyWith<$Res> {
  _$UpdateQuickAddValue1CopyWithImpl(this._self, this._then);

  final UpdateQuickAddValue1 _self;
  final $Res Function(UpdateQuickAddValue1) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateQuickAddValue1(
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


class UpdateQuickAddValue2 implements AppDataState {
  const UpdateQuickAddValue2(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuickAddValue2CopyWith<UpdateQuickAddValue2> get copyWith => _$UpdateQuickAddValue2CopyWithImpl<UpdateQuickAddValue2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuickAddValue2&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateQuickAddValue2(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateQuickAddValue2CopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateQuickAddValue2CopyWith(UpdateQuickAddValue2 value, $Res Function(UpdateQuickAddValue2) _then) = _$UpdateQuickAddValue2CopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateQuickAddValue2CopyWithImpl<$Res>
    implements $UpdateQuickAddValue2CopyWith<$Res> {
  _$UpdateQuickAddValue2CopyWithImpl(this._self, this._then);

  final UpdateQuickAddValue2 _self;
  final $Res Function(UpdateQuickAddValue2) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateQuickAddValue2(
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


class UpdateQuickAddValue3 implements AppDataState {
  const UpdateQuickAddValue3(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuickAddValue3CopyWith<UpdateQuickAddValue3> get copyWith => _$UpdateQuickAddValue3CopyWithImpl<UpdateQuickAddValue3>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuickAddValue3&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateQuickAddValue3(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateQuickAddValue3CopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateQuickAddValue3CopyWith(UpdateQuickAddValue3 value, $Res Function(UpdateQuickAddValue3) _then) = _$UpdateQuickAddValue3CopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateQuickAddValue3CopyWithImpl<$Res>
    implements $UpdateQuickAddValue3CopyWith<$Res> {
  _$UpdateQuickAddValue3CopyWithImpl(this._self, this._then);

  final UpdateQuickAddValue3 _self;
  final $Res Function(UpdateQuickAddValue3) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateQuickAddValue3(
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


class UpdateQuickAddValueAll implements AppDataState {
  const UpdateQuickAddValueAll(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuickAddValueAllCopyWith<UpdateQuickAddValueAll> get copyWith => _$UpdateQuickAddValueAllCopyWithImpl<UpdateQuickAddValueAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuickAddValueAll&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateQuickAddValueAll(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateQuickAddValueAllCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateQuickAddValueAllCopyWith(UpdateQuickAddValueAll value, $Res Function(UpdateQuickAddValueAll) _then) = _$UpdateQuickAddValueAllCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateQuickAddValueAllCopyWithImpl<$Res>
    implements $UpdateQuickAddValueAllCopyWith<$Res> {
  _$UpdateQuickAddValueAllCopyWithImpl(this._self, this._then);

  final UpdateQuickAddValueAll _self;
  final $Res Function(UpdateQuickAddValueAll) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateQuickAddValueAll(
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


class UpdateDailyGoal implements AppDataState {
  const UpdateDailyGoal(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDailyGoalCopyWith<UpdateDailyGoal> get copyWith => _$UpdateDailyGoalCopyWithImpl<UpdateDailyGoal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDailyGoal&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateDailyGoal(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateDailyGoalCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateDailyGoalCopyWith(UpdateDailyGoal value, $Res Function(UpdateDailyGoal) _then) = _$UpdateDailyGoalCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateDailyGoalCopyWithImpl<$Res>
    implements $UpdateDailyGoalCopyWith<$Res> {
  _$UpdateDailyGoalCopyWithImpl(this._self, this._then);

  final UpdateDailyGoal _self;
  final $Res Function(UpdateDailyGoal) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateDailyGoal(
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


class UpdateInProgress implements AppDataState {
  const UpdateInProgress(this.data);
  

@override final  AppDataStateData data;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateInProgressCopyWith<UpdateInProgress> get copyWith => _$UpdateInProgressCopyWithImpl<UpdateInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateInProgress&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AppDataState.updateInProgress(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateInProgressCopyWith<$Res> implements $AppDataStateCopyWith<$Res> {
  factory $UpdateInProgressCopyWith(UpdateInProgress value, $Res Function(UpdateInProgress) _then) = _$UpdateInProgressCopyWithImpl;
@override @useResult
$Res call({
 AppDataStateData data
});


@override $AppDataStateDataCopyWith<$Res> get data;

}
/// @nodoc
class _$UpdateInProgressCopyWithImpl<$Res>
    implements $UpdateInProgressCopyWith<$Res> {
  _$UpdateInProgressCopyWithImpl(this._self, this._then);

  final UpdateInProgress _self;
  final $Res Function(UpdateInProgress) _then;

/// Create a copy of AppDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateInProgress(
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
