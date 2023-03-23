import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_list_response.freezed.dart';
part 'cart_list_response.g.dart';


@freezed
class CartListResponse with _$CartListResponse {
  
  const factory CartListResponse({
    @Default([]) List<CartItemResponseData> data,
    @Default(0.0) double cartTotal,
    @Default(0) int badgeCount,
  }) = _CartListResponse;

  factory CartListResponse.fromJson(Map<String, dynamic> json) =>
      _$CartListResponseFromJson(json);
}

@freezed
class CartItemResponseData with _$CartItemResponseData {
  const factory CartItemResponseData({
    required String id,
    @JsonKey(name: 'user_id')
    required String userId,
    @JsonKey(name: 'product_id')
    required String productId,
    @JsonKey(name: 'product_name')
    required String productName,
    @JsonKey(name: 'short_description')
    required String shortDescription,
    required String qty,
    required String price,
    @JsonKey(name: 'discounted_price')
    @Default('0.0') String discountedPrice,
    @Default('0.0') String discount,
    @JsonKey(name: 'line_amount')
    required String lineAmount,   
    required String thumbnail,
    required String currency,
  }) = _CartItemResponseData;

  factory CartItemResponseData.fromJson(Map<String, dynamic> json) => _$CartItemResponseDataFromJson(json);
}
