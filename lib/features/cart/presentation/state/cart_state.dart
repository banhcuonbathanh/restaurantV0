import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(AsyncLoading()) AsyncValue<List<CartItem>> cartItems1,
    @Default(false) final bool isLoading,
    final String? errorMsg,
    @Default('') final String cartTotal,
    @Default(0) final int badgeCount,
  }) = _CartState;
}
