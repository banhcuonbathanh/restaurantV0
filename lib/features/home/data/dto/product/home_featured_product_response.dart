import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_featured_product_response.freezed.dart';
part 'home_featured_product_response.g.dart';

List<HomeFeaturedProductResponse> listFeaturedProductFromJson(dynamic str) =>
    List<HomeFeaturedProductResponse>.from(
        (str).map((e) => HomeFeaturedProductResponse.fromJson(e)));

@freezed
class HomeFeaturedProductResponse with _$HomeFeaturedProductResponse {
  const factory HomeFeaturedProductResponse({
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
  }) = _HomeFeaturedProductResponse;

  factory HomeFeaturedProductResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeFeaturedProductResponseFromJson(json);
}
