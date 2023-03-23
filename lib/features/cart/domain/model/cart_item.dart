import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int id,
    required int userId,
    required int productId,
    required String productName,
    required String shortDescription,
    required int qty,
    required double price,
    required String formattedPrice,
    @Default(0.0) double discountedPrice,
    @Default('') String formattedDiscountedPrice,
    @Default(0.0) double discount,
    @Default('') final String formattedDiscount,
    required double lineAmount,
    required String thumbnail,
  }) = _CartItem;
}
