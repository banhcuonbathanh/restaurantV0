import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';

part 'add_to_cart_model.freezed.dart';

@freezed
class AddToCartModel with _$AddToCartModel {
  const factory AddToCartModel({
    required CartItem cartItem,
    required String formattedTotal,
    required int badgeCount,
  }) = _AddToCartModel;
}
