import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_banner_response.freezed.dart';
part 'home_banner_response.g.dart';

@freezed
class HomeBannerResponse with _$HomeBannerResponse {
  const factory HomeBannerResponse({
    required int id,
    @JsonKey(name: 'banner_id') required String bannerId,
    required String name,
    required String image,
    String? title,
    String? description,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _HomeBannerResponse;

  factory HomeBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerResponseFromJson(json);
}
