// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchBannerResponse _$$_SearchBannerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchBannerResponse(
      id: json['id'] as int,
      bannerId: json['banner_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isActive: json['is_active'] as String,
    );

Map<String, dynamic> _$$_SearchBannerResponseToJson(
        _$_SearchBannerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'banner_id': instance.bannerId,
      'name': instance.name,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'is_active': instance.isActive,
    };
