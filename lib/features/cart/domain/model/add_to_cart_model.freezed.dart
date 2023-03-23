// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddToCartModel {
  CartItem get cartItem => throw _privateConstructorUsedError;
  String get formattedTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddToCartModelCopyWith<AddToCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartModelCopyWith<$Res> {
  factory $AddToCartModelCopyWith(
          AddToCartModel value, $Res Function(AddToCartModel) then) =
      _$AddToCartModelCopyWithImpl<$Res, AddToCartModel>;
  @useResult
  $Res call({CartItem cartItem, String formattedTotal, int badgeCount});

  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class _$AddToCartModelCopyWithImpl<$Res, $Val extends AddToCartModel>
    implements $AddToCartModelCopyWith<$Res> {
  _$AddToCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? formattedTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
      formattedTotal: null == formattedTotal
          ? _value.formattedTotal
          : formattedTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res> get cartItem {
    return $CartItemCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddToCartModelCopyWith<$Res>
    implements $AddToCartModelCopyWith<$Res> {
  factory _$$_AddToCartModelCopyWith(
          _$_AddToCartModel value, $Res Function(_$_AddToCartModel) then) =
      __$$_AddToCartModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CartItem cartItem, String formattedTotal, int badgeCount});

  @override
  $CartItemCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$_AddToCartModelCopyWithImpl<$Res>
    extends _$AddToCartModelCopyWithImpl<$Res, _$_AddToCartModel>
    implements _$$_AddToCartModelCopyWith<$Res> {
  __$$_AddToCartModelCopyWithImpl(
      _$_AddToCartModel _value, $Res Function(_$_AddToCartModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? formattedTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_AddToCartModel(
      cartItem: null == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as CartItem,
      formattedTotal: null == formattedTotal
          ? _value.formattedTotal
          : formattedTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddToCartModel implements _AddToCartModel {
  const _$_AddToCartModel(
      {required this.cartItem,
      required this.formattedTotal,
      required this.badgeCount});

  @override
  final CartItem cartItem;
  @override
  final String formattedTotal;
  @override
  final int badgeCount;

  @override
  String toString() {
    return 'AddToCartModel(cartItem: $cartItem, formattedTotal: $formattedTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToCartModel &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem) &&
            (identical(other.formattedTotal, formattedTotal) ||
                other.formattedTotal == formattedTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cartItem, formattedTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToCartModelCopyWith<_$_AddToCartModel> get copyWith =>
      __$$_AddToCartModelCopyWithImpl<_$_AddToCartModel>(this, _$identity);
}

abstract class _AddToCartModel implements AddToCartModel {
  const factory _AddToCartModel(
      {required final CartItem cartItem,
      required final String formattedTotal,
      required final int badgeCount}) = _$_AddToCartModel;

  @override
  CartItem get cartItem;
  @override
  String get formattedTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_AddToCartModelCopyWith<_$_AddToCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}
