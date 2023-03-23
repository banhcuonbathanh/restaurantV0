import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_brand_response.freezed.dart';
part 'search_brand_response.g.dart';

@freezed
class SearchBrandResponse with _$SearchBrandResponse {
  const factory SearchBrandResponse({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _SearchBrandResponse;

  factory SearchBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBrandResponseFromJson(json);
}
