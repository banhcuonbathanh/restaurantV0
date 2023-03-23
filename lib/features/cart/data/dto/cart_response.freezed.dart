// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  CartItemResponseData get data => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) then) =
      _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call({CartItemResponseData data, double cartTotal, int badgeCount});

  $CartItemResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CartItemResponseData,
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

  @override
  @pragma('vm:prefer-inline')
  $CartItemResponseDataCopyWith<$Res> get data {
    return $CartItemResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartResponseCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$_CartResponseCopyWith(
          _$_CartResponse value, $Res Function(_$_CartResponse) then) =
      __$$_CartResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CartItemResponseData data, double cartTotal, int badgeCount});

  @override
  $CartItemResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_CartResponseCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$_CartResponse>
    implements _$$_CartResponseCopyWith<$Res> {
  __$$_CartResponseCopyWithImpl(
      _$_CartResponse _value, $Res Function(_$_CartResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CartItemResponseData,
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
class _$_CartResponse implements _CartResponse {
  const _$_CartResponse(
      {required this.data, this.cartTotal = 0.0, this.badgeCount = 0});

  factory _$_CartResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CartResponseFromJson(json);

  @override
  final CartItemResponseData data;
  @override
  @JsonKey()
  final double cartTotal;
  @override
  @JsonKey()
  final int badgeCount;

  @override
  String toString() {
    return 'CartResponse(data: $data, cartTotal: $cartTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, cartTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartResponseCopyWith<_$_CartResponse> get copyWith =>
      __$$_CartResponseCopyWithImpl<_$_CartResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartResponseToJson(
      this,
    );
  }
}

abstract class _CartResponse implements CartResponse {
  const factory _CartResponse(
      {required final CartItemResponseData data,
      final double cartTotal,
      final int badgeCount}) = _$_CartResponse;

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$_CartResponse.fromJson;

  @override
  CartItemResponseData get data;
  @override
  double get cartTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartResponseCopyWith<_$_CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
