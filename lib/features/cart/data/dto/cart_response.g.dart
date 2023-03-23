// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartResponse _$$_CartResponseFromJson(Map<String, dynamic> json) =>
    _$_CartResponse(
      data: CartItemResponseData.fromJson(json['data'] as Map<String, dynamic>),
      cartTotal: (json['cartTotal'] as num?)?.toDouble() ?? 0.0,
      badgeCount: json['badgeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CartResponseToJson(_$_CartResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'cartTotal': instance.cartTotal,
      'badgeCount': instance.badgeCount,
    };
