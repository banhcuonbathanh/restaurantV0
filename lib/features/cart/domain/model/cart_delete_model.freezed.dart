// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_delete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartDeleteModel {
  bool get deleted => throw _privateConstructorUsedError;
  String get formattedCartTotal => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartDeleteModelCopyWith<CartDeleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDeleteModelCopyWith<$Res> {
  factory $CartDeleteModelCopyWith(
          CartDeleteModel value, $Res Function(CartDeleteModel) then) =
      _$CartDeleteModelCopyWithImpl<$Res, CartDeleteModel>;
  @useResult
  $Res call({bool deleted, String formattedCartTotal, int badgeCount});
}

/// @nodoc
class _$CartDeleteModelCopyWithImpl<$Res, $Val extends CartDeleteModel>
    implements $CartDeleteModelCopyWith<$Res> {
  _$CartDeleteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleted = null,
    Object? formattedCartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_value.copyWith(
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      formattedCartTotal: null == formattedCartTotal
          ? _value.formattedCartTotal
          : formattedCartTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartDeleteModelCopyWith<$Res>
    implements $CartDeleteModelCopyWith<$Res> {
  factory _$$_CartDeleteModelCopyWith(
          _$_CartDeleteModel value, $Res Function(_$_CartDeleteModel) then) =
      __$$_CartDeleteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool deleted, String formattedCartTotal, int badgeCount});
}

/// @nodoc
class __$$_CartDeleteModelCopyWithImpl<$Res>
    extends _$CartDeleteModelCopyWithImpl<$Res, _$_CartDeleteModel>
    implements _$$_CartDeleteModelCopyWith<$Res> {
  __$$_CartDeleteModelCopyWithImpl(
      _$_CartDeleteModel _value, $Res Function(_$_CartDeleteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleted = null,
    Object? formattedCartTotal = null,
    Object? badgeCount = null,
  }) {
    return _then(_$_CartDeleteModel(
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      formattedCartTotal: null == formattedCartTotal
          ? _value.formattedCartTotal
          : formattedCartTotal // ignore: cast_nullable_to_non_nullable
              as String,
      badgeCount: null == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartDeleteModel implements _CartDeleteModel {
  const _$_CartDeleteModel(
      {required this.deleted,
      required this.formattedCartTotal,
      required this.badgeCount});

  @override
  final bool deleted;
  @override
  final String formattedCartTotal;
  @override
  final int badgeCount;

  @override
  String toString() {
    return 'CartDeleteModel(deleted: $deleted, formattedCartTotal: $formattedCartTotal, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartDeleteModel &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.formattedCartTotal, formattedCartTotal) ||
                other.formattedCartTotal == formattedCartTotal) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deleted, formattedCartTotal, badgeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartDeleteModelCopyWith<_$_CartDeleteModel> get copyWith =>
      __$$_CartDeleteModelCopyWithImpl<_$_CartDeleteModel>(this, _$identity);
}

abstract class _CartDeleteModel implements CartDeleteModel {
  const factory _CartDeleteModel(
      {required final bool deleted,
      required final String formattedCartTotal,
      required final int badgeCount}) = _$_CartDeleteModel;

  @override
  bool get deleted;
  @override
  String get formattedCartTotal;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartDeleteModelCopyWith<_$_CartDeleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
