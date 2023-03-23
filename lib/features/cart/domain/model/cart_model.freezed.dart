// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartModel {
  List<CartItem> get cartItem => throw _privateConstructorUsedError;
  String get formattedTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call({List<CartItem> cartItem, String formattedTotal, int badgeCount});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

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
              as List<CartItem>,
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
}

/// @nodoc
abstract class _$$_CartModelCopyWith<$Res> implements $CartModelCopyWith<$Res> {
  factory _$$_CartModelCopyWith(
          _$_CartModel value, $Res Function(_$_CartModel) then) =
      __$$_CartModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartItem> cartItem, String formattedTotal, int badgeCount});
}

/// @nodoc
class __$$_CartModelCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$_CartModel>
    implements _$$_CartModelCopyWith<$Res> {
  __$$_CartModelCopyWithImpl(
      _$_CartModel _value, $Res Function(_$_CartModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = null,
    Object? formattedTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartModel(
      cartItem: null == cartItem
          ? _value._cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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

class _$_CartModel implements _CartModel {
  const _$_CartModel(
      {required final List<CartItem> cartItem,
      required this.formattedTotal,
      required this.badgeCount})
      : _cartItem = cartItem;

  final List<CartItem> _cartItem;
  @override
  List<CartItem> get cartItem {
    if (_cartItem is EqualUnmodifiableListView) return _cartItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItem);
  }

  @override
  final String formattedTotal;
  @override
  final int badgeCount;

  @override
  String toString() {
    return 'CartModel(cartItem: $cartItem, formattedTotal: $formattedTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartModel &&
            const DeepCollectionEquality().equals(other._cartItem, _cartItem) &&
            (identical(other.formattedTotal, formattedTotal) ||
                other.formattedTotal == formattedTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItem),
      formattedTotal,
      badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartModelCopyWith<_$_CartModel> get copyWith =>
      __$$_CartModelCopyWithImpl<_$_CartModel>(this, _$identity);
}

abstract class _CartModel implements CartModel {
  const factory _CartModel(
      {required final List<CartItem> cartItem,
      required final String formattedTotal,
      required final int badgeCount}) = _$_CartModel;

  @override
  List<CartItem> get cartItem;
  @override
  String get formattedTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartModelCopyWith<_$_CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}
