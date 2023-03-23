// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_delete_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartDeleteResponse _$CartDeleteResponseFromJson(Map<String, dynamic> json) {
  return _CartDeleteResponse.fromJson(json);
}

/// @nodoc
mixin _$CartDeleteResponse {
  bool get deleted => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDeleteResponseCopyWith<CartDeleteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDeleteResponseCopyWith<$Res> {
  factory $CartDeleteResponseCopyWith(
          CartDeleteResponse value, $Res Function(CartDeleteResponse) then) =
      _$CartDeleteResponseCopyWithImpl<$Res, CartDeleteResponse>;
  @useResult
  $Res call({bool deleted, double cartTotal, int badgeCount});
}

/// @nodoc
class _$CartDeleteResponseCopyWithImpl<$Res, $Val extends CartDeleteResponse>
    implements $CartDeleteResponseCopyWith<$Res> {
  _$CartDeleteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleted = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartDeleteResponseCopyWith<$Res>
    implements $CartDeleteResponseCopyWith<$Res> {
  factory _$$_CartDeleteResponseCopyWith(_$_CartDeleteResponse value,
          $Res Function(_$_CartDeleteResponse) then) =
      __$$_CartDeleteResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool deleted, double cartTotal, int badgeCount});
}

/// @nodoc
class __$$_CartDeleteResponseCopyWithImpl<$Res>
    extends _$CartDeleteResponseCopyWithImpl<$Res, _$_CartDeleteResponse>
    implements _$$_CartDeleteResponseCopyWith<$Res> {
  __$$_CartDeleteResponseCopyWithImpl(
      _$_CartDeleteResponse _value, $Res Function(_$_CartDeleteResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleted = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartDeleteResponse(
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartDeleteResponse implements _CartDeleteResponse {
  const _$_CartDeleteResponse(
      {required this.deleted, this.cartTotal = 0.0, this.badgeCount = 0});

  factory _$_CartDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CartDeleteResponseFromJson(json);

  @override
  final bool deleted;
  @override
  @JsonKey()
  final double cartTotal;
  @override
  @JsonKey()
  final int badgeCount;

  @override
  String toString() {
    return 'CartDeleteResponse(deleted: $deleted, cartTotal: $cartTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartDeleteResponse &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deleted, cartTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartDeleteResponseCopyWith<_$_CartDeleteResponse> get copyWith =>
      __$$_CartDeleteResponseCopyWithImpl<_$_CartDeleteResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartDeleteResponseToJson(
      this,
    );
  }
}

abstract class _CartDeleteResponse implements CartDeleteResponse {
  const factory _CartDeleteResponse(
      {required final bool deleted,
      final double cartTotal,
      final int badgeCount}) = _$_CartDeleteResponse;

  factory _CartDeleteResponse.fromJson(Map<String, dynamic> json) =
      _$_CartDeleteResponse.fromJson;

  @override
  bool get deleted;
  @override
  double get cartTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartDeleteResponseCopyWith<_$_CartDeleteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
