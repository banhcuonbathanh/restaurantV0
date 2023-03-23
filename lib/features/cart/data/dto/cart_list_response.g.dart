// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartListResponse _$$_CartListResponseFromJson(Map<String, dynamic> json) =>
    _$_CartListResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  CartItemResponseData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cartTotal: (json['cartTotal'] as num?)?.toDouble() ?? 0.0,
      badgeCount: json['badgeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CartListResponseToJson(_$_CartListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'cartTotal': instance.cartTotal,
      'badgeCount': instance.badgeCount,
    };

_$_CartItemResponseData _$$_CartItemResponseDataFromJson(
        Map<String, dynamic> json) =>
    _$_CartItemResponseData(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      shortDescription: json['short_description'] as String,
      qty: json['qty'] as String,
      price: json['price'] as String,
      discountedPrice: json['discounted_price'] as String? ?? '0.0',
      discount: json['discount'] as String? ?? '0.0',
      lineAmount: json['line_amount'] as String,
      thumbnail: json['thumbnail'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$_CartItemResponseDataToJson(
        _$_CartItemResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'short_description': instance.shortDescription,
      'qty': instance.qty,
      'price': instance.price,
      'discounted_price': instance.discountedPrice,
      'discount': instance.discount,
      'line_amount': instance.lineAmount,
      'thumbnail': instance.thumbnail,
      'currency': instance.currency,
    };
