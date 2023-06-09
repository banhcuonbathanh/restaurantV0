// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_brand_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchBrandResponse _$SearchBrandResponseFromJson(Map<String, dynamic> json) {
  return _SearchBrandResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchBrandResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  String get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchBrandResponseCopyWith<SearchBrandResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBrandResponseCopyWith<$Res> {
  factory $SearchBrandResponseCopyWith(
          SearchBrandResponse value, $Res Function(SearchBrandResponse) then) =
      _$SearchBrandResponseCopyWithImpl<$Res, SearchBrandResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String thumbnail,
      String image,
      @JsonKey(name: 'is_active') String isActive});
}

/// @nodoc
class _$SearchBrandResponseCopyWithImpl<$Res, $Val extends SearchBrandResponse>
    implements $SearchBrandResponseCopyWith<$Res> {
  _$SearchBrandResponseCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchBrandResponseCopyWith<$Res>
    implements $SearchBrandResponseCopyWith<$Res> {
  factory _$$_SearchBrandResponseCopyWith(_$_SearchBrandResponse value,
          $Res Function(_$_SearchBrandResponse) then) =
      __$$_SearchBrandResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String thumbnail,
      String image,
      @JsonKey(name: 'is_active') String isActive});
}

/// @nodoc
class __$$_SearchBrandResponseCopyWithImpl<$Res>
    extends _$SearchBrandResponseCopyWithImpl<$Res, _$_SearchBrandResponse>
    implements _$$_SearchBrandResponseCopyWith<$Res> {
  __$$_SearchBrandResponseCopyWithImpl(_$_SearchBrandResponse _value,
      $Res Function(_$_SearchBrandResponse) _then)
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
    return _then(_$_SearchBrandResponse(
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchBrandResponse implements _SearchBrandResponse {
  const _$_SearchBrandResponse(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      required this.image,
      @JsonKey(name: 'is_active') required this.isActive});

  factory _$_SearchBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchBrandResponseFromJson(json);

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
  @JsonKey(name: 'is_active')
  final String isActive;

  @override
  String toString() {
    return 'SearchBrandResponse(id: $id, name: $name, description: $description, thumbnail: $thumbnail, image: $image, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchBrandResponse &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, thumbnail, image, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchBrandResponseCopyWith<_$_SearchBrandResponse> get copyWith =>
      __$$_SearchBrandResponseCopyWithImpl<_$_SearchBrandResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchBrandResponseToJson(
      this,
    );
  }
}

abstract class _SearchBrandResponse implements SearchBrandResponse {
  const factory _SearchBrandResponse(
          {required final int id,
          required final String name,
          required final String description,
          required final String thumbnail,
          required final String image,
          @JsonKey(name: 'is_active') required final String isActive}) =
      _$_SearchBrandResponse;

  factory _SearchBrandResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchBrandResponse.fromJson;

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
  @JsonKey(name: 'is_active')
  String get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SearchBrandResponseCopyWith<_$_SearchBrandResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
