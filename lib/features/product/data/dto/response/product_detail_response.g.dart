// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetailResponse _$$_ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDetailResponse(
      product: ProductDetail.fromJson(json['product'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductDetailResponseToJson(
        _$_ProductDetailResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'images': instance.images,
    };

_$_ImageData _$$_ImageDataFromJson(Map<String, dynamic> json) => _$_ImageData(
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_ImageDataToJson(_$_ImageData instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

_$_ProductDetail _$$_ProductDetailFromJson(Map<String, dynamic> json) =>
    _$_ProductDetail(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      brandId: json['brand_id'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      shortDescription: json['short_description'] as String,
      longDescription: json['long_description'] as String,
      thumbnail: json['thumbnail'] as String,
      images: json['images'] as String,
      isActive: json['is_active'] as String,
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      price: json['price'] as String,
      discount: json['discount'] as String,
      currency: json['currency'] as String,
      qty: json['qty'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_ProductDetailToJson(_$_ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'brand_id': instance.brandId,
      'sku': instance.sku,
      'name': instance.name,
      'short_description': instance.shortDescription,
      'long_description': instance.longDescription,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'is_active': instance.isActive,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'price': instance.price,
      'discount': instance.discount,
      'currency': instance.currency,
      'qty': instance.qty,
      'brand': instance.brand,
      'category': instance.category,
    };
