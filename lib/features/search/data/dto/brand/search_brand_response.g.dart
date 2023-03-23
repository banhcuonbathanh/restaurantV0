// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_brand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchBrandResponse _$$_SearchBrandResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchBrandResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      image: json['image'] as String,
      isActive: json['is_active'] as String,
    );

Map<String, dynamic> _$$_SearchBrandResponseToJson(
        _$_SearchBrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'is_active': instance.isActive,
    };
