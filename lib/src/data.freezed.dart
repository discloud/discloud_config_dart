// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscloudConfigData {

/// A list of packages to be installed.
@TextToIterableConverter() Iterable<String>? get APT;/// Whether the application should automatically restart.
@TextToBoolConverter() bool? get AUTORESTART;/// The URL of the application's avatar.
 String? get AVATAR;/// The hostname of the application.
 String? get HOSTNAME;/// The ID of the application.
 String? get ID;/// The main file of the application.
 String? get MAIN;/// The name of the application.
 String? get NAME;/// The amount of RAM allocated to the application.
@TextToIntConverter() int? get RAM;/// The command to start the application.
 String? get START;/// The storage path for the application.
 String? get STORAGE;/// The type of the application (e.g., 'bot', 'site').
 String? get TYPE;/// The version of the application.
 String? get VERSION;/// Whether the application is on a VLAN.
@TextToBoolConverter() bool? get VLAN;
/// Create a copy of DiscloudConfigData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscloudConfigDataCopyWith<DiscloudConfigData> get copyWith => _$DiscloudConfigDataCopyWithImpl<DiscloudConfigData>(this as DiscloudConfigData, _$identity);

  /// Serializes this DiscloudConfigData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscloudConfigData&&const DeepCollectionEquality().equals(other.APT, APT)&&(identical(other.AUTORESTART, AUTORESTART) || other.AUTORESTART == AUTORESTART)&&(identical(other.AVATAR, AVATAR) || other.AVATAR == AVATAR)&&(identical(other.HOSTNAME, HOSTNAME) || other.HOSTNAME == HOSTNAME)&&(identical(other.ID, ID) || other.ID == ID)&&(identical(other.MAIN, MAIN) || other.MAIN == MAIN)&&(identical(other.NAME, NAME) || other.NAME == NAME)&&(identical(other.RAM, RAM) || other.RAM == RAM)&&(identical(other.START, START) || other.START == START)&&(identical(other.STORAGE, STORAGE) || other.STORAGE == STORAGE)&&(identical(other.TYPE, TYPE) || other.TYPE == TYPE)&&(identical(other.VERSION, VERSION) || other.VERSION == VERSION)&&(identical(other.VLAN, VLAN) || other.VLAN == VLAN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(APT),AUTORESTART,AVATAR,HOSTNAME,ID,MAIN,NAME,RAM,START,STORAGE,TYPE,VERSION,VLAN);

@override
String toString() {
  return 'DiscloudConfigData(APT: $APT, AUTORESTART: $AUTORESTART, AVATAR: $AVATAR, HOSTNAME: $HOSTNAME, ID: $ID, MAIN: $MAIN, NAME: $NAME, RAM: $RAM, START: $START, STORAGE: $STORAGE, TYPE: $TYPE, VERSION: $VERSION, VLAN: $VLAN)';
}


}

/// @nodoc
abstract mixin class $DiscloudConfigDataCopyWith<$Res>  {
  factory $DiscloudConfigDataCopyWith(DiscloudConfigData value, $Res Function(DiscloudConfigData) _then) = _$DiscloudConfigDataCopyWithImpl;
@useResult
$Res call({
@TextToIterableConverter() Iterable<String>? APT,@TextToBoolConverter() bool? AUTORESTART, String? AVATAR, String? HOSTNAME, String? ID, String? MAIN, String? NAME,@TextToIntConverter() int? RAM, String? START, String? STORAGE, String? TYPE, String? VERSION,@TextToBoolConverter() bool? VLAN
});




}
/// @nodoc
class _$DiscloudConfigDataCopyWithImpl<$Res>
    implements $DiscloudConfigDataCopyWith<$Res> {
  _$DiscloudConfigDataCopyWithImpl(this._self, this._then);

  final DiscloudConfigData _self;
  final $Res Function(DiscloudConfigData) _then;

/// Create a copy of DiscloudConfigData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? APT = freezed,Object? AUTORESTART = freezed,Object? AVATAR = freezed,Object? HOSTNAME = freezed,Object? ID = freezed,Object? MAIN = freezed,Object? NAME = freezed,Object? RAM = freezed,Object? START = freezed,Object? STORAGE = freezed,Object? TYPE = freezed,Object? VERSION = freezed,Object? VLAN = freezed,}) {
  return _then(_self.copyWith(
APT: freezed == APT ? _self.APT : APT // ignore: cast_nullable_to_non_nullable
as Iterable<String>?,AUTORESTART: freezed == AUTORESTART ? _self.AUTORESTART : AUTORESTART // ignore: cast_nullable_to_non_nullable
as bool?,AVATAR: freezed == AVATAR ? _self.AVATAR : AVATAR // ignore: cast_nullable_to_non_nullable
as String?,HOSTNAME: freezed == HOSTNAME ? _self.HOSTNAME : HOSTNAME // ignore: cast_nullable_to_non_nullable
as String?,ID: freezed == ID ? _self.ID : ID // ignore: cast_nullable_to_non_nullable
as String?,MAIN: freezed == MAIN ? _self.MAIN : MAIN // ignore: cast_nullable_to_non_nullable
as String?,NAME: freezed == NAME ? _self.NAME : NAME // ignore: cast_nullable_to_non_nullable
as String?,RAM: freezed == RAM ? _self.RAM : RAM // ignore: cast_nullable_to_non_nullable
as int?,START: freezed == START ? _self.START : START // ignore: cast_nullable_to_non_nullable
as String?,STORAGE: freezed == STORAGE ? _self.STORAGE : STORAGE // ignore: cast_nullable_to_non_nullable
as String?,TYPE: freezed == TYPE ? _self.TYPE : TYPE // ignore: cast_nullable_to_non_nullable
as String?,VERSION: freezed == VERSION ? _self.VERSION : VERSION // ignore: cast_nullable_to_non_nullable
as String?,VLAN: freezed == VLAN ? _self.VLAN : VLAN // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscloudConfigData].
extension DiscloudConfigDataPatterns on DiscloudConfigData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscloudConfigData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscloudConfigData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscloudConfigData value)  $default,){
final _that = this;
switch (_that) {
case _DiscloudConfigData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscloudConfigData value)?  $default,){
final _that = this;
switch (_that) {
case _DiscloudConfigData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@TextToIterableConverter()  Iterable<String>? APT, @TextToBoolConverter()  bool? AUTORESTART,  String? AVATAR,  String? HOSTNAME,  String? ID,  String? MAIN,  String? NAME, @TextToIntConverter()  int? RAM,  String? START,  String? STORAGE,  String? TYPE,  String? VERSION, @TextToBoolConverter()  bool? VLAN)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscloudConfigData() when $default != null:
return $default(_that.APT,_that.AUTORESTART,_that.AVATAR,_that.HOSTNAME,_that.ID,_that.MAIN,_that.NAME,_that.RAM,_that.START,_that.STORAGE,_that.TYPE,_that.VERSION,_that.VLAN);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@TextToIterableConverter()  Iterable<String>? APT, @TextToBoolConverter()  bool? AUTORESTART,  String? AVATAR,  String? HOSTNAME,  String? ID,  String? MAIN,  String? NAME, @TextToIntConverter()  int? RAM,  String? START,  String? STORAGE,  String? TYPE,  String? VERSION, @TextToBoolConverter()  bool? VLAN)  $default,) {final _that = this;
switch (_that) {
case _DiscloudConfigData():
return $default(_that.APT,_that.AUTORESTART,_that.AVATAR,_that.HOSTNAME,_that.ID,_that.MAIN,_that.NAME,_that.RAM,_that.START,_that.STORAGE,_that.TYPE,_that.VERSION,_that.VLAN);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@TextToIterableConverter()  Iterable<String>? APT, @TextToBoolConverter()  bool? AUTORESTART,  String? AVATAR,  String? HOSTNAME,  String? ID,  String? MAIN,  String? NAME, @TextToIntConverter()  int? RAM,  String? START,  String? STORAGE,  String? TYPE,  String? VERSION, @TextToBoolConverter()  bool? VLAN)?  $default,) {final _that = this;
switch (_that) {
case _DiscloudConfigData() when $default != null:
return $default(_that.APT,_that.AUTORESTART,_that.AVATAR,_that.HOSTNAME,_that.ID,_that.MAIN,_that.NAME,_that.RAM,_that.START,_that.STORAGE,_that.TYPE,_that.VERSION,_that.VLAN);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _DiscloudConfigData implements DiscloudConfigData {
  const _DiscloudConfigData({@TextToIterableConverter() this.APT, @TextToBoolConverter() this.AUTORESTART, this.AVATAR, this.HOSTNAME, this.ID, this.MAIN, this.NAME, @TextToIntConverter() this.RAM, this.START, this.STORAGE, this.TYPE, this.VERSION, @TextToBoolConverter() this.VLAN});
  factory _DiscloudConfigData.fromJson(Map<String, dynamic> json) => _$DiscloudConfigDataFromJson(json);

/// A list of packages to be installed.
@override@TextToIterableConverter() final  Iterable<String>? APT;
/// Whether the application should automatically restart.
@override@TextToBoolConverter() final  bool? AUTORESTART;
/// The URL of the application's avatar.
@override final  String? AVATAR;
/// The hostname of the application.
@override final  String? HOSTNAME;
/// The ID of the application.
@override final  String? ID;
/// The main file of the application.
@override final  String? MAIN;
/// The name of the application.
@override final  String? NAME;
/// The amount of RAM allocated to the application.
@override@TextToIntConverter() final  int? RAM;
/// The command to start the application.
@override final  String? START;
/// The storage path for the application.
@override final  String? STORAGE;
/// The type of the application (e.g., 'bot', 'site').
@override final  String? TYPE;
/// The version of the application.
@override final  String? VERSION;
/// Whether the application is on a VLAN.
@override@TextToBoolConverter() final  bool? VLAN;

/// Create a copy of DiscloudConfigData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscloudConfigDataCopyWith<_DiscloudConfigData> get copyWith => __$DiscloudConfigDataCopyWithImpl<_DiscloudConfigData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscloudConfigDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscloudConfigData&&const DeepCollectionEquality().equals(other.APT, APT)&&(identical(other.AUTORESTART, AUTORESTART) || other.AUTORESTART == AUTORESTART)&&(identical(other.AVATAR, AVATAR) || other.AVATAR == AVATAR)&&(identical(other.HOSTNAME, HOSTNAME) || other.HOSTNAME == HOSTNAME)&&(identical(other.ID, ID) || other.ID == ID)&&(identical(other.MAIN, MAIN) || other.MAIN == MAIN)&&(identical(other.NAME, NAME) || other.NAME == NAME)&&(identical(other.RAM, RAM) || other.RAM == RAM)&&(identical(other.START, START) || other.START == START)&&(identical(other.STORAGE, STORAGE) || other.STORAGE == STORAGE)&&(identical(other.TYPE, TYPE) || other.TYPE == TYPE)&&(identical(other.VERSION, VERSION) || other.VERSION == VERSION)&&(identical(other.VLAN, VLAN) || other.VLAN == VLAN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(APT),AUTORESTART,AVATAR,HOSTNAME,ID,MAIN,NAME,RAM,START,STORAGE,TYPE,VERSION,VLAN);

@override
String toString() {
  return 'DiscloudConfigData(APT: $APT, AUTORESTART: $AUTORESTART, AVATAR: $AVATAR, HOSTNAME: $HOSTNAME, ID: $ID, MAIN: $MAIN, NAME: $NAME, RAM: $RAM, START: $START, STORAGE: $STORAGE, TYPE: $TYPE, VERSION: $VERSION, VLAN: $VLAN)';
}


}

/// @nodoc
abstract mixin class _$DiscloudConfigDataCopyWith<$Res> implements $DiscloudConfigDataCopyWith<$Res> {
  factory _$DiscloudConfigDataCopyWith(_DiscloudConfigData value, $Res Function(_DiscloudConfigData) _then) = __$DiscloudConfigDataCopyWithImpl;
@override @useResult
$Res call({
@TextToIterableConverter() Iterable<String>? APT,@TextToBoolConverter() bool? AUTORESTART, String? AVATAR, String? HOSTNAME, String? ID, String? MAIN, String? NAME,@TextToIntConverter() int? RAM, String? START, String? STORAGE, String? TYPE, String? VERSION,@TextToBoolConverter() bool? VLAN
});




}
/// @nodoc
class __$DiscloudConfigDataCopyWithImpl<$Res>
    implements _$DiscloudConfigDataCopyWith<$Res> {
  __$DiscloudConfigDataCopyWithImpl(this._self, this._then);

  final _DiscloudConfigData _self;
  final $Res Function(_DiscloudConfigData) _then;

/// Create a copy of DiscloudConfigData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? APT = freezed,Object? AUTORESTART = freezed,Object? AVATAR = freezed,Object? HOSTNAME = freezed,Object? ID = freezed,Object? MAIN = freezed,Object? NAME = freezed,Object? RAM = freezed,Object? START = freezed,Object? STORAGE = freezed,Object? TYPE = freezed,Object? VERSION = freezed,Object? VLAN = freezed,}) {
  return _then(_DiscloudConfigData(
APT: freezed == APT ? _self.APT : APT // ignore: cast_nullable_to_non_nullable
as Iterable<String>?,AUTORESTART: freezed == AUTORESTART ? _self.AUTORESTART : AUTORESTART // ignore: cast_nullable_to_non_nullable
as bool?,AVATAR: freezed == AVATAR ? _self.AVATAR : AVATAR // ignore: cast_nullable_to_non_nullable
as String?,HOSTNAME: freezed == HOSTNAME ? _self.HOSTNAME : HOSTNAME // ignore: cast_nullable_to_non_nullable
as String?,ID: freezed == ID ? _self.ID : ID // ignore: cast_nullable_to_non_nullable
as String?,MAIN: freezed == MAIN ? _self.MAIN : MAIN // ignore: cast_nullable_to_non_nullable
as String?,NAME: freezed == NAME ? _self.NAME : NAME // ignore: cast_nullable_to_non_nullable
as String?,RAM: freezed == RAM ? _self.RAM : RAM // ignore: cast_nullable_to_non_nullable
as int?,START: freezed == START ? _self.START : START // ignore: cast_nullable_to_non_nullable
as String?,STORAGE: freezed == STORAGE ? _self.STORAGE : STORAGE // ignore: cast_nullable_to_non_nullable
as String?,TYPE: freezed == TYPE ? _self.TYPE : TYPE // ignore: cast_nullable_to_non_nullable
as String?,VERSION: freezed == VERSION ? _self.VERSION : VERSION // ignore: cast_nullable_to_non_nullable
as String?,VLAN: freezed == VLAN ? _self.VLAN : VLAN // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
