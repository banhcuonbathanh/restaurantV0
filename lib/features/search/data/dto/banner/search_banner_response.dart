import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_banner_response.freezed.dart';
part 'search_banner_response.g.dart';

@freezed
class SearchBannerResponse with _$SearchBannerResponse {
  const factory SearchBannerResponse({
    required int id,
    @JsonKey(name: 'banner_id') required String bannerId,
    required String name,
    required String image,
    String? title,
    String? description,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _SearchBannerResponse;

  factory SearchBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBannerResponseFromJson(json);
}
