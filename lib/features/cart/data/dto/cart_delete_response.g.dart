// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartDeleteResponse _$$_CartDeleteResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CartDeleteResponse(
      deleted: json['deleted'] as bool,
      cartTotal: (json['cartTotal'] as num?)?.toDouble() ?? 0.0,
      badgeCount: json['badgeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CartDeleteResponseToJson(
        _$_CartDeleteResponse instance) =>
    <String, dynamic>{
      'deleted': instance.deleted,
      'cartTotal': instance.cartTotal,
      'badgeCount': instance.badgeCount,
    };
