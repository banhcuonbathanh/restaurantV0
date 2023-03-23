// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchCategoryModelCopyWith<SearchCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCategoryModelCopyWith<$Res> {
  factory $SearchCategoryModelCopyWith(
          SearchCategoryModel value, $Res Function(SearchCategoryModel) then) =
      _$SearchCategoryModelCopyWithImpl<$Res, SearchCategoryModel>;
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
class _$SearchCategoryModelCopyWithImpl<$Res, $Val extends SearchCategoryModel>
    implements $SearchCategoryModelCopyWith<$Res> {
  _$SearchCategoryModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchCategoryModelCopyWith<$Res>
    implements $SearchCategoryModelCopyWith<$Res> {
  factory _$$_SearchCategoryModelCopyWith(_$_SearchCategoryModel value,
          $Res Function(_$_SearchCategoryModel) then) =
      __$$_SearchCategoryModelCopyWithImpl<$Res>;
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
class __$$_SearchCategoryModelCopyWithImpl<$Res>
    extends _$SearchCategoryModelCopyWithImpl<$Res, _$_SearchCategoryModel>
    implements _$$_SearchCategoryModelCopyWith<$Res> {
  __$$_SearchCategoryModelCopyWithImpl(_$_SearchCategoryModel _value,
      $Res Function(_$_SearchCategoryModel) _then)
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
    return _then(_$_SearchCategoryModel(
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

class _$_SearchCategoryModel implements _SearchCategoryModel {
  const _$_SearchCategoryModel(
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
    return 'SearchCategoryModel(id: $id, name: $name, description: $description, thumbnail: $thumbnail, image: $image, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCategoryModel &&
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
  _$$_SearchCategoryModelCopyWith<_$_SearchCategoryModel> get copyWith =>
      __$$_SearchCategoryModelCopyWithImpl<_$_SearchCategoryModel>(
          this, _$identity);
}

abstract class _SearchCategoryModel implements SearchCategoryModel {
  const factory _SearchCategoryModel(
      {required final int id,
      required final String name,
      required final String description,
      required final String thumbnail,
      required final String image,
      required final int isActive}) = _$_SearchCategoryModel;

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
  _$$_SearchCategoryModelCopyWith<_$_SearchCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
