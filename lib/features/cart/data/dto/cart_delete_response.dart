import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_delete_response.freezed.dart';
part 'cart_delete_response.g.dart';

@freezed
class CartDeleteResponse with _$CartDeleteResponse {
  const factory CartDeleteResponse({
    required bool deleted,
    @Default(0.0) double cartTotal,
    @Default(0) int badgeCount,
  }) = _CartDeleteResponse;

  factory CartDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$CartDeleteResponseFromJson(json);
}
