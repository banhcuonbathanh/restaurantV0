import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_category_response.freezed.dart';
part 'home_category_response.g.dart';

@freezed
class HomeCategoryResponse with _$HomeCategoryResponse {
  const factory HomeCategoryResponse({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _HomeCategoryResponse;

  factory HomeCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryResponseFromJson(json);
}
