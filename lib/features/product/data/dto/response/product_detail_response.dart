import 'package:freezed_annotation/freezed_annotation.dart';


part 'product_detail_response.freezed.dart';
part 'product_detail_response.g.dart';


@freezed
class ProductDetailResponse with _$ProductDetailResponse {
  const factory ProductDetailResponse({
    required ProductDetail product,
    required List<ImageData> images,
  }) = _ProductDetailResponse;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailResponseFromJson(json);
}

@freezed
class ImageData with _$ImageData {
  const factory ImageData({
    required  String image,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
}

@freezed
class ProductDetail with _$ProductDetail {
  const factory ProductDetail({
    required String id,
    @JsonKey(name: 'category_id')
    required String categoryId,
    @JsonKey(name: 'brand_id')
    required String brandId,
    required String sku,
    required String name,
    @JsonKey(name: 'short_description')
    required String shortDescription,
    @JsonKey(name: 'long_description')
    required String longDescription,
    required String thumbnail,
    required String images,
    @JsonKey(name: 'is_active')
    required String isActive,
    @JsonKey(name: 'deleted_at')
    DateTime? deletedAt,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
    required String price,
    required String discount,
    required String currency,
    required String qty,
    required String brand,
    required String category,
  }) = _ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => _$ProductDetailFromJson(json);
}
