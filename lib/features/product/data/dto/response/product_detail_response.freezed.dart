// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDetailResponse _$ProductDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailResponse {
  ProductDetail get product => throw _privateConstructorUsedError;
  List<ImageData> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailResponseCopyWith<ProductDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailResponseCopyWith<$Res> {
  factory $ProductDetailResponseCopyWith(ProductDetailResponse value,
          $Res Function(ProductDetailResponse) then) =
      _$ProductDetailResponseCopyWithImpl<$Res, ProductDetailResponse>;
  @useResult
  $Res call({ProductDetail product, List<ImageData> images});

  $ProductDetailCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductDetailResponseCopyWithImpl<$Res,
        $Val extends ProductDetailResponse>
    implements $ProductDetailResponseCopyWith<$Res> {
  _$ProductDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDetail,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageData>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductDetailCopyWith<$Res> get product {
    return $ProductDetailCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductDetailResponseCopyWith<$Res>
    implements $ProductDetailResponseCopyWith<$Res> {
  factory _$$_ProductDetailResponseCopyWith(_$_ProductDetailResponse value,
          $Res Function(_$_ProductDetailResponse) then) =
      __$$_ProductDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductDetail product, List<ImageData> images});

  @override
  $ProductDetailCopyWith<$Res> get product;
}

/// @nodoc
class __$$_ProductDetailResponseCopyWithImpl<$Res>
    extends _$ProductDetailResponseCopyWithImpl<$Res, _$_ProductDetailResponse>
    implements _$$_ProductDetailResponseCopyWith<$Res> {
  __$$_ProductDetailResponseCopyWithImpl(_$_ProductDetailResponse _value,
      $Res Function(_$_ProductDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? images = null,
  }) {
    return _then(_$_ProductDetailResponse(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDetail,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDetailResponse implements _ProductDetailResponse {
  const _$_ProductDetailResponse(
      {required this.product, required final List<ImageData> images})
      : _images = images;

  factory _$_ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDetailResponseFromJson(json);

  @override
  final ProductDetail product;
  final List<ImageData> _images;
  @override
  List<ImageData> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductDetailResponse(product: $product, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailResponse &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, product, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailResponseCopyWith<_$_ProductDetailResponse> get copyWith =>
      __$$_ProductDetailResponseCopyWithImpl<_$_ProductDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDetailResponseToJson(
      this,
    );
  }
}

abstract class _ProductDetailResponse implements ProductDetailResponse {
  const factory _ProductDetailResponse(
      {required final ProductDetail product,
      required final List<ImageData> images}) = _$_ProductDetailResponse;

  factory _ProductDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductDetailResponse.fromJson;

  @override
  ProductDetail get product;
  @override
  List<ImageData> get images;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailResponseCopyWith<_$_ProductDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageData _$ImageDataFromJson(Map<String, dynamic> json) {
  return _ImageData.fromJson(json);
}

/// @nodoc
mixin _$ImageData {
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDataCopyWith<ImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDataCopyWith<$Res> {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) then) =
      _$ImageDataCopyWithImpl<$Res, ImageData>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$ImageDataCopyWithImpl<$Res, $Val extends ImageData>
    implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageDataCopyWith<$Res> implements $ImageDataCopyWith<$Res> {
  factory _$$_ImageDataCopyWith(
          _$_ImageData value, $Res Function(_$_ImageData) then) =
      __$$_ImageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$_ImageDataCopyWithImpl<$Res>
    extends _$ImageDataCopyWithImpl<$Res, _$_ImageData>
    implements _$$_ImageDataCopyWith<$Res> {
  __$$_ImageDataCopyWithImpl(
      _$_ImageData _value, $Res Function(_$_ImageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_ImageData(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageData implements _ImageData {
  const _$_ImageData({required this.image});

  factory _$_ImageData.fromJson(Map<String, dynamic> json) =>
      _$$_ImageDataFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'ImageData(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageData &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageDataCopyWith<_$_ImageData> get copyWith =>
      __$$_ImageDataCopyWithImpl<_$_ImageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageDataToJson(
      this,
    );
  }
}

abstract class _ImageData implements ImageData {
  const factory _ImageData({required final String image}) = _$_ImageData;

  factory _ImageData.fromJson(Map<String, dynamic> json) =
      _$_ImageData.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ImageDataCopyWith<_$_ImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return _ProductDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductDetail {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_id')
  String get brandId => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'long_description')
  String get longDescription => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  String get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get discount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get qty => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailCopyWith<ProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailCopyWith<$Res> {
  factory $ProductDetailCopyWith(
          ProductDetail value, $Res Function(ProductDetail) then) =
      _$ProductDetailCopyWithImpl<$Res, ProductDetail>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'brand_id') String brandId,
      String sku,
      String name,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'long_description') String longDescription,
      String thumbnail,
      String images,
      @JsonKey(name: 'is_active') String isActive,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String price,
      String discount,
      String currency,
      String qty,
      String brand,
      String category});
}

/// @nodoc
class _$ProductDetailCopyWithImpl<$Res, $Val extends ProductDetail>
    implements $ProductDetailCopyWith<$Res> {
  _$ProductDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? brandId = null,
    Object? sku = null,
    Object? name = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? thumbnail = null,
    Object? images = null,
    Object? isActive = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? price = null,
    Object? discount = null,
    Object? currency = null,
    Object? qty = null,
    Object? brand = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDetailCopyWith<$Res>
    implements $ProductDetailCopyWith<$Res> {
  factory _$$_ProductDetailCopyWith(
          _$_ProductDetail value, $Res Function(_$_ProductDetail) then) =
      __$$_ProductDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'brand_id') String brandId,
      String sku,
      String name,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'long_description') String longDescription,
      String thumbnail,
      String images,
      @JsonKey(name: 'is_active') String isActive,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String price,
      String discount,
      String currency,
      String qty,
      String brand,
      String category});
}

/// @nodoc
class __$$_ProductDetailCopyWithImpl<$Res>
    extends _$ProductDetailCopyWithImpl<$Res, _$_ProductDetail>
    implements _$$_ProductDetailCopyWith<$Res> {
  __$$_ProductDetailCopyWithImpl(
      _$_ProductDetail _value, $Res Function(_$_ProductDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? brandId = null,
    Object? sku = null,
    Object? name = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? thumbnail = null,
    Object? images = null,
    Object? isActive = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? price = null,
    Object? discount = null,
    Object? currency = null,
    Object? qty = null,
    Object? brand = null,
    Object? category = null,
  }) {
    return _then(_$_ProductDetail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDetail implements _ProductDetail {
  const _$_ProductDetail(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'brand_id') required this.brandId,
      required this.sku,
      required this.name,
      @JsonKey(name: 'short_description') required this.shortDescription,
      @JsonKey(name: 'long_description') required this.longDescription,
      required this.thumbnail,
      required this.images,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.price,
      required this.discount,
      required this.currency,
      required this.qty,
      required this.brand,
      required this.category});

  factory _$_ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDetailFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'brand_id')
  final String brandId;
  @override
  final String sku;
  @override
  final String name;
  @override
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @override
  @JsonKey(name: 'long_description')
  final String longDescription;
  @override
  final String thumbnail;
  @override
  final String images;
  @override
  @JsonKey(name: 'is_active')
  final String isActive;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String price;
  @override
  final String discount;
  @override
  final String currency;
  @override
  final String qty;
  @override
  final String brand;
  @override
  final String category;

  @override
  String toString() {
    return 'ProductDetail(id: $id, categoryId: $categoryId, brandId: $brandId, sku: $sku, name: $name, shortDescription: $shortDescription, longDescription: $longDescription, thumbnail: $thumbnail, images: $images, isActive: $isActive, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, price: $price, discount: $discount, currency: $currency, qty: $qty, brand: $brand, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        categoryId,
        brandId,
        sku,
        name,
        shortDescription,
        longDescription,
        thumbnail,
        images,
        isActive,
        deletedAt,
        createdAt,
        updatedAt,
        price,
        discount,
        currency,
        qty,
        brand,
        category
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailCopyWith<_$_ProductDetail> get copyWith =>
      __$$_ProductDetailCopyWithImpl<_$_ProductDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDetailToJson(
      this,
    );
  }
}

abstract class _ProductDetail implements ProductDetail {
  const factory _ProductDetail(
      {required final String id,
      @JsonKey(name: 'category_id')
          required final String categoryId,
      @JsonKey(name: 'brand_id')
          required final String brandId,
      required final String sku,
      required final String name,
      @JsonKey(name: 'short_description')
          required final String shortDescription,
      @JsonKey(name: 'long_description')
          required final String longDescription,
      required final String thumbnail,
      required final String images,
      @JsonKey(name: 'is_active')
          required final String isActive,
      @JsonKey(name: 'deleted_at')
          final DateTime? deletedAt,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
          required final DateTime updatedAt,
      required final String price,
      required final String discount,
      required final String currency,
      required final String qty,
      required final String brand,
      required final String category}) = _$_ProductDetail;

  factory _ProductDetail.fromJson(Map<String, dynamic> json) =
      _$_ProductDetail.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'brand_id')
  String get brandId;
  @override
  String get sku;
  @override
  String get name;
  @override
  @JsonKey(name: 'short_description')
  String get shortDescription;
  @override
  @JsonKey(name: 'long_description')
  String get longDescription;
  @override
  String get thumbnail;
  @override
  String get images;
  @override
  @JsonKey(name: 'is_active')
  String get isActive;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String get price;
  @override
  String get discount;
  @override
  String get currency;
  @override
  String get qty;
  @override
  String get brand;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailCopyWith<_$_ProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
