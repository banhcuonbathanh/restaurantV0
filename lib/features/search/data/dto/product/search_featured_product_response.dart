import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_featured_product_response.freezed.dart';
part 'search_featured_product_response.g.dart';

List<SearchFeaturedProductResponse> listFeaturedProductFromJson(dynamic str) =>
    List<SearchFeaturedProductResponse>.from(
        (str).map((e) => SearchFeaturedProductResponse.fromJson(e)));

@freezed
class SearchFeaturedProductResponse with _$SearchFeaturedProductResponse {
  const factory SearchFeaturedProductResponse({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'brand_id') required String brandId,
    required String sku,
    required String name,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'long_description') required String longDescription,
    required String thumbnail,
    required String images,
    @JsonKey(name: 'is_active') required String isActive,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'created_at') required DateTime createAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String price,
    required String discount,
    required String currency,
    required String qty,
    required String brand,
    required String category,
  }) = _SearchFeaturedProductResponse;

  factory SearchFeaturedProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFeaturedProductResponseFromJson(json);
}
