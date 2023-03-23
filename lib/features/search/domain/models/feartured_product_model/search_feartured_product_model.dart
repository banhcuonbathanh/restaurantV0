import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_feartured_product_model.freezed.dart';

@freezed
class SearchFeatureProductModel with _$SearchFeatureProductModel {
  const factory SearchFeatureProductModel({
    required final int id,
    required final int categoryId,
    required final int brandId,
    required final String sku,
    required final String name,
    required final String shortDescription,
    required final String longDescription,
    required final String thumbnail,
    required final String images,
    required final int isActive,
    required final double price,
    required final double discount,
    required final double discountedPrice,
    required final String formattedPrice,
    required final String formattedDiscount,
    required final String formattedDiscountedPrice,
    required final String currency,
    required final int qty,
    required final String category,
    required final String brand,
  }) = _SearchFeatureProductModel;
}
