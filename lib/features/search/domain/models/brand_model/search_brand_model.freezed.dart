// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchBrandModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchBrandModelCopyWith<SearchBrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBrandModelCopyWith<$Res> {
  factory $SearchBrandModelCopyWith(
          SearchBrandModel value, $Res Function(SearchBrandModel) then) =
      _$SearchBrandModelCopyWithImpl<$Res, SearchBrandModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String thumbnail,
      String image,
      int isActive});
}

/// @nodoc
class _$SearchBrandModelCopyWithImpl<$Res, $Val extends SearchBrandModel>
    implements $SearchBrandModelCopyWith<$Res> {
  _$SearchBrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? image = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchBrandModelCopyWith<$Res>
    implements $SearchBrandModelCopyWith<$Res> {
  factory _$$_SearchBrandModelCopyWith(
          _$_SearchBrandModel value, $Res Function(_$_SearchBrandModel) then) =
      __$$_SearchBrandModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String thumbnail,
      String image,
      int isActive});
}

/// @nodoc
class __$$_SearchBrandModelCopyWithImpl<$Res>
    extends _$SearchBrandModelCopyWithImpl<$Res, _$_SearchBrandModel>
    implements _$$_SearchBrandModelCopyWith<$Res> {
  __$$_SearchBrandModelCopyWithImpl(
      _$_SearchBrandModel _value, $Res Function(_$_SearchBrandModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? image = null,
    Object? isActive = null,
  }) {
    return _then(_$_SearchBrandModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SearchBrandModel implements _SearchBrandModel {
  const _$_SearchBrandModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      required this.image,
      required this.isActive});

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String thumbnail;
  @override
  final String image;
  @override
  final int isActive;

  @override
  String toString() {
    return 'SearchBrandModel(id: $id, name: $name, description: $description, thumbnail: $thumbnail, image: $image, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchBrandModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, thumbnail, image, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchBrandModelCopyWith<_$_SearchBrandModel> get copyWith =>
      __$$_SearchBrandModelCopyWithImpl<_$_SearchBrandModel>(this, _$identity);
}

abstract class _SearchBrandModel implements SearchBrandModel {
  const factory _SearchBrandModel(
      {required final int id,
      required final String name,
      required final String description,
      required final String thumbnail,
      required final String image,
      required final int isActive}) = _$_SearchBrandModel;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get thumbnail;
  @override
  String get image;
  @override
  int get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SearchBrandModelCopyWith<_$_SearchBrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}
