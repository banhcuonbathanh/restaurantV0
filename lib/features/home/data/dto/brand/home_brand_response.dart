import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_brand_response.freezed.dart';
part 'home_brand_response.g.dart';

@freezed
class HomeBrandResponse with _$HomeBrandResponse {
  const factory HomeBrandResponse({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _HomeBrandResponse;

  factory HomeBrandResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeBrandResponseFromJson(json);
}
