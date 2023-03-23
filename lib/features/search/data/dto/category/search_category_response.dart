import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_category_response.freezed.dart';
part 'search_category_response.g.dart';

@freezed
class SearchCategoryResponse with _$SearchCategoryResponse {
  const factory SearchCategoryResponse({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    @JsonKey(name: 'is_active') required String isActive,
  }) = _SearchCategoryResponse;

  factory SearchCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchCategoryResponseFromJson(json);
}
