import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_list_response.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    required CartItemResponseData data,
    @Default(0.0) double cartTotal,
    @Default(0) int badgeCount,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
