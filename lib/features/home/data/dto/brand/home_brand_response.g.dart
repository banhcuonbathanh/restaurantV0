// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_brand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeBrandResponse _$$_HomeBrandResponseFromJson(Map<String, dynamic> json) =>
    _$_HomeBrandResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      image: json['image'] as String,
      isActive: json['is_active'] as String,
    );

Map<String, dynamic> _$$_HomeBrandResponseToJson(
        _$_HomeBrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'is_active': instance.isActive,
    };
