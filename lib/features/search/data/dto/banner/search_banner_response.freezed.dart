// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_banner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchBannerResponse _$SearchBannerResponseFromJson(Map<String, dynamic> json) {
  return _SearchBannerResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchBannerResponse {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'banner_id')
  String get bannerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  String get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchBannerResponseCopyWith<SearchBannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBannerResponseCopyWith<$Res> {
  factory $SearchBannerResponseCopyWith(SearchBannerResponse value,
          $Res Function(SearchBannerResponse) then) =
      _$SearchBannerResponseCopyWithImpl<$Res, SearchBannerResponse>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'banner_id') String bannerId,
      String name,
      String image,
      String? title,
      String? description,
      @JsonKey(name: 'is_active') String isActive});
}

/// @nodoc
class _$SearchBannerResponseCopyWithImpl<$Res,
        $Val extends SearchBannerResponse>
    implements $SearchBannerResponseCopyWith<$Res> {
  _$SearchBannerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bannerId = null,
    Object? name = null,
    Object? image = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchBannerResponseCopyWith<$Res>
    implements $SearchBannerResponseCopyWith<$Res> {
  factory _$$_SearchBannerResponseCopyWith(_$_SearchBannerResponse value,
          $Res Function(_$_SearchBannerResponse) then) =
      __$$_SearchBannerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'banner_id') String bannerId,
      String name,
      String image,
      String? title,
      String? description,
      @JsonKey(name: 'is_active') String isActive});
}

/// @nodoc
class __$$_SearchBannerResponseCopyWithImpl<$Res>
    extends _$SearchBannerResponseCopyWithImpl<$Res, _$_SearchBannerResponse>
    implements _$$_SearchBannerResponseCopyWith<$Res> {
  __$$_SearchBannerResponseCopyWithImpl(_$_SearchBannerResponse _value,
      $Res Function(_$_SearchBannerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bannerId = null,
    Object? name = null,
    Object? image = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_SearchBannerResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchBannerResponse implements _SearchBannerResponse {
  const _$_SearchBannerResponse(
      {required this.id,
      @JsonKey(name: 'banner_id') required this.bannerId,
      required this.name,
      required this.image,
      this.title,
      this.description,
      @JsonKey(name: 'is_active') required this.isActive});

  factory _$_SearchBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchBannerResponseFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'banner_id')
  final String bannerId;
  @override
  final String name;
  @override
  final String image;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_active')
  final String isActive;

  @override
  String toString() {
    return 'SearchBannerResponse(id: $id, bannerId: $bannerId, name: $name, image: $image, title: $title, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchBannerResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bannerId, bannerId) ||
                other.bannerId == bannerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, bannerId, name, image, title, description, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchBannerResponseCopyWith<_$_SearchBannerResponse> get copyWith =>
      __$$_SearchBannerResponseCopyWithImpl<_$_SearchBannerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchBannerResponseToJson(
      this,
    );
  }
}

abstract class _SearchBannerResponse implements SearchBannerResponse {
  const factory _SearchBannerResponse(
          {required final int id,
          @JsonKey(name: 'banner_id') required final String bannerId,
          required final String name,
          required final String image,
          final String? title,
          final String? description,
          @JsonKey(name: 'is_active') required final String isActive}) =
      _$_SearchBannerResponse;

  factory _SearchBannerResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchBannerResponse.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'banner_id')
  String get bannerId;
  @override
  String get name;
  @override
  String get image;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_active')
  String get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SearchBannerResponseCopyWith<_$_SearchBannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
