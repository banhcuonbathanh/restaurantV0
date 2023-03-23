// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductResponse _$$_ProductResponseFromJson(Map<String, dynamic> json) =>
    _$_ProductResponse(
      currentPage: json['current_page'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastPage: json['last_page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ProductResponseToJson(_$_ProductResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_$_ProductData _$$_ProductDataFromJson(Map<String, dynamic> json) =>
    _$_ProductData(
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

Map<String, dynamic> _$$_ProductDataToJson(_$_ProductData instance) =>
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
