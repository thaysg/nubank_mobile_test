// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LinkModel {

 String get alias;@JsonKey(name: '_links') LinkLinksModel get links;
/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkModelCopyWith<LinkModel> get copyWith => _$LinkModelCopyWithImpl<LinkModel>(this as LinkModel, _$identity);

  /// Serializes this LinkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkModel&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alias,links);

@override
String toString() {
  return 'LinkModel(alias: $alias, links: $links)';
}


}

/// @nodoc
abstract mixin class $LinkModelCopyWith<$Res>  {
  factory $LinkModelCopyWith(LinkModel value, $Res Function(LinkModel) _then) = _$LinkModelCopyWithImpl;
@useResult
$Res call({
 String alias,@JsonKey(name: '_links') LinkLinksModel links
});


$LinkLinksModelCopyWith<$Res> get links;

}
/// @nodoc
class _$LinkModelCopyWithImpl<$Res>
    implements $LinkModelCopyWith<$Res> {
  _$LinkModelCopyWithImpl(this._self, this._then);

  final LinkModel _self;
  final $Res Function(LinkModel) _then;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alias = null,Object? links = null,}) {
  return _then(_self.copyWith(
alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as LinkLinksModel,
  ));
}
/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinkLinksModelCopyWith<$Res> get links {
  
  return $LinkLinksModelCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// Adds pattern-matching-related methods to [LinkModel].
extension LinkModelPatterns on LinkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkModel value)  $default,){
final _that = this;
switch (_that) {
case _LinkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkModel value)?  $default,){
final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alias, @JsonKey(name: '_links')  LinkLinksModel links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
return $default(_that.alias,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alias, @JsonKey(name: '_links')  LinkLinksModel links)  $default,) {final _that = this;
switch (_that) {
case _LinkModel():
return $default(_that.alias,_that.links);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alias, @JsonKey(name: '_links')  LinkLinksModel links)?  $default,) {final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
return $default(_that.alias,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LinkModel extends LinkModel {
  const _LinkModel({required this.alias, @JsonKey(name: '_links') required this.links}): super._();
  factory _LinkModel.fromJson(Map<String, dynamic> json) => _$LinkModelFromJson(json);

@override final  String alias;
@override@JsonKey(name: '_links') final  LinkLinksModel links;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkModelCopyWith<_LinkModel> get copyWith => __$LinkModelCopyWithImpl<_LinkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkModel&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alias,links);

@override
String toString() {
  return 'LinkModel(alias: $alias, links: $links)';
}


}

/// @nodoc
abstract mixin class _$LinkModelCopyWith<$Res> implements $LinkModelCopyWith<$Res> {
  factory _$LinkModelCopyWith(_LinkModel value, $Res Function(_LinkModel) _then) = __$LinkModelCopyWithImpl;
@override @useResult
$Res call({
 String alias,@JsonKey(name: '_links') LinkLinksModel links
});


@override $LinkLinksModelCopyWith<$Res> get links;

}
/// @nodoc
class __$LinkModelCopyWithImpl<$Res>
    implements _$LinkModelCopyWith<$Res> {
  __$LinkModelCopyWithImpl(this._self, this._then);

  final _LinkModel _self;
  final $Res Function(_LinkModel) _then;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alias = null,Object? links = null,}) {
  return _then(_LinkModel(
alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as LinkLinksModel,
  ));
}

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinkLinksModelCopyWith<$Res> get links {
  
  return $LinkLinksModelCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc
mixin _$LinkLinksModel {

 String get self; String get short;
/// Create a copy of LinkLinksModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkLinksModelCopyWith<LinkLinksModel> get copyWith => _$LinkLinksModelCopyWithImpl<LinkLinksModel>(this as LinkLinksModel, _$identity);

  /// Serializes this LinkLinksModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkLinksModel&&(identical(other.self, self) || other.self == self)&&(identical(other.short, short) || other.short == short));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,short);

@override
String toString() {
  return 'LinkLinksModel(self: $self, short: $short)';
}


}

/// @nodoc
abstract mixin class $LinkLinksModelCopyWith<$Res>  {
  factory $LinkLinksModelCopyWith(LinkLinksModel value, $Res Function(LinkLinksModel) _then) = _$LinkLinksModelCopyWithImpl;
@useResult
$Res call({
 String self, String short
});




}
/// @nodoc
class _$LinkLinksModelCopyWithImpl<$Res>
    implements $LinkLinksModelCopyWith<$Res> {
  _$LinkLinksModelCopyWithImpl(this._self, this._then);

  final LinkLinksModel _self;
  final $Res Function(LinkLinksModel) _then;

/// Create a copy of LinkLinksModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? self = null,Object? short = null,}) {
  return _then(_self.copyWith(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LinkLinksModel].
extension LinkLinksModelPatterns on LinkLinksModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkLinksModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkLinksModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkLinksModel value)  $default,){
final _that = this;
switch (_that) {
case _LinkLinksModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkLinksModel value)?  $default,){
final _that = this;
switch (_that) {
case _LinkLinksModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String self,  String short)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkLinksModel() when $default != null:
return $default(_that.self,_that.short);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String self,  String short)  $default,) {final _that = this;
switch (_that) {
case _LinkLinksModel():
return $default(_that.self,_that.short);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String self,  String short)?  $default,) {final _that = this;
switch (_that) {
case _LinkLinksModel() when $default != null:
return $default(_that.self,_that.short);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LinkLinksModel implements LinkLinksModel {
  const _LinkLinksModel({required this.self, required this.short});
  factory _LinkLinksModel.fromJson(Map<String, dynamic> json) => _$LinkLinksModelFromJson(json);

@override final  String self;
@override final  String short;

/// Create a copy of LinkLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkLinksModelCopyWith<_LinkLinksModel> get copyWith => __$LinkLinksModelCopyWithImpl<_LinkLinksModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkLinksModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkLinksModel&&(identical(other.self, self) || other.self == self)&&(identical(other.short, short) || other.short == short));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,short);

@override
String toString() {
  return 'LinkLinksModel(self: $self, short: $short)';
}


}

/// @nodoc
abstract mixin class _$LinkLinksModelCopyWith<$Res> implements $LinkLinksModelCopyWith<$Res> {
  factory _$LinkLinksModelCopyWith(_LinkLinksModel value, $Res Function(_LinkLinksModel) _then) = __$LinkLinksModelCopyWithImpl;
@override @useResult
$Res call({
 String self, String short
});




}
/// @nodoc
class __$LinkLinksModelCopyWithImpl<$Res>
    implements _$LinkLinksModelCopyWith<$Res> {
  __$LinkLinksModelCopyWithImpl(this._self, this._then);

  final _LinkLinksModel _self;
  final $Res Function(_LinkLinksModel) _then;

/// Create a copy of LinkLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? self = null,Object? short = null,}) {
  return _then(_LinkLinksModel(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
