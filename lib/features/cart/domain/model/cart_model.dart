import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required List<CartItem> cartItem,
    required String formattedTotal,
    required int badgeCount,
  }) = _CartModel;
}
