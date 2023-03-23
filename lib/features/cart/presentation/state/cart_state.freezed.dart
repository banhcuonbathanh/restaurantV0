// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  AsyncValue<List<CartItem>> get cartItems1 =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;
  String get cartTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {AsyncValue<List<CartItem>> cartItems1,
      bool isLoading,
      String? errorMsg,
      String cartTotal,
      int badgeCount});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems1 = null,
    Object? isLoading = null,
    Object? errorMsg = freezed,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      cartItems1: null == cartItems1
          ? _value.cartItems1
          : cartItems1 // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CartItem>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<CartItem>> cartItems1,
      bool isLoading,
      String? errorMsg,
      String cartTotal,
      int badgeCount});
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_CartState>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems1 = null,
    Object? isLoading = null,
    Object? errorMsg = freezed,
    Object? cartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartState(
      cartItems1: null == cartItems1
          ? _value.cartItems1
          : cartItems1 // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CartItem>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartState implements _CartState {
  const _$_CartState(
      {this.cartItems1 = const AsyncLoading(),
      this.isLoading = false,
      this.errorMsg,
      this.cartTotal = '',
      this.badgeCount = 0});

  @override
  @JsonKey()
  final AsyncValue<List<CartItem>> cartItems1;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMsg;
  @override
  @JsonKey()
  final String cartTotal;
  @override
  @JsonKey()
  final int badgeCount;

  @override
  String toString() {
    return 'CartState(cartItems1: $cartItems1, isLoading: $isLoading, errorMsg: $errorMsg, cartTotal: $cartTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            (identical(other.cartItems1, cartItems1) ||
                other.cartItems1 == cartItems1) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, cartItems1, isLoading, errorMsg, cartTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final AsyncValue<List<CartItem>> cartItems1,
      final bool isLoading,
      final String? errorMsg,
      final String cartTotal,
      final int badgeCount}) = _$_CartState;

  @override
  AsyncValue<List<CartItem>> get cartItems1;
  @override
  bool get isLoading;
  @override
  String? get errorMsg;
  @override
  String get cartTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
