// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  AsyncValue<List<String>> get banners => throw _privateConstructorUsedError;
  AsyncValue<List<SearchBrandModel>> get brands =>
      throw _privateConstructorUsedError;
  AsyncValue<List<SearchCategoryModel>> get categories =>
      throw _privateConstructorUsedError;
  AsyncValue<List<SearchFeatureProductModel>> get feartureProduct =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {AsyncValue<List<String>> banners,
      AsyncValue<List<SearchBrandModel>> brands,
      AsyncValue<List<SearchCategoryModel>> categories,
      AsyncValue<List<SearchFeatureProductModel>> feartureProduct});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? brands = null,
    Object? categories = null,
    Object? feartureProduct = null,
  }) {
    return _then(_value.copyWith(
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchBrandModel>>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchCategoryModel>>,
      feartureProduct: null == feartureProduct
          ? _value.feartureProduct
          : feartureProduct // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchFeatureProductModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<String>> banners,
      AsyncValue<List<SearchBrandModel>> brands,
      AsyncValue<List<SearchCategoryModel>> categories,
      AsyncValue<List<SearchFeatureProductModel>> feartureProduct});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? brands = null,
    Object? categories = null,
    Object? feartureProduct = null,
  }) {
    return _then(_$_SearchState(
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchBrandModel>>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchCategoryModel>>,
      feartureProduct: null == feartureProduct
          ? _value.feartureProduct
          : feartureProduct // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SearchFeatureProductModel>>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.banners = const AsyncValue.loading(),
      this.brands = const AsyncValue.loading(),
      this.categories = const AsyncValue.loading(),
      this.feartureProduct = const AsyncValue.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<String>> banners;
  @override
  @JsonKey()
  final AsyncValue<List<SearchBrandModel>> brands;
  @override
  @JsonKey()
  final AsyncValue<List<SearchCategoryModel>> categories;
  @override
  @JsonKey()
  final AsyncValue<List<SearchFeatureProductModel>> feartureProduct;

  @override
  String toString() {
    return 'SearchState(banners: $banners, brands: $brands, categories: $categories, feartureProduct: $feartureProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.banners, banners) || other.banners == banners) &&
            (identical(other.brands, brands) || other.brands == brands) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.feartureProduct, feartureProduct) ||
                other.feartureProduct == feartureProduct));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, banners, brands, categories, feartureProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
          {final AsyncValue<List<String>> banners,
          final AsyncValue<List<SearchBrandModel>> brands,
          final AsyncValue<List<SearchCategoryModel>> categories,
          final AsyncValue<List<SearchFeatureProductModel>> feartureProduct}) =
      _$_SearchState;

  @override
  AsyncValue<List<String>> get banners;
  @override
  AsyncValue<List<SearchBrandModel>> get brands;
  @override
  AsyncValue<List<SearchCategoryModel>> get categories;
  @override
  AsyncValue<List<SearchFeatureProductModel>> get feartureProduct;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
