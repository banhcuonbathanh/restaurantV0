import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_brand_model.freezed.dart';

@freezed
class SearchBrandModel with _$SearchBrandModel {
  const factory SearchBrandModel({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    required int isActive,
  }) = _SearchBrandModel;
}
