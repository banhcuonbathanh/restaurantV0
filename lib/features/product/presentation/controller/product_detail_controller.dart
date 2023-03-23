import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../setting/presentation/controller/setting_controller.dart';
import '../../application/product_service.dart';
import '../state/product_detail_state.dart';

/// return the instance of the ProductDetailController
final productDetailControllerProvider =
    AutoDisposeNotifierProvider<ProductDetailController, ProductDetailState>(
  ProductDetailController.new,
);

class ProductDetailController extends AutoDisposeNotifier<ProductDetailState> {
  @override
  ProductDetailState build() {
    return const ProductDetailState();
  }

  void getProduct(int id) async {
    final service = ref.read(productServiceProvider);
    final result = await service.getProduct(id);
    result.when(
      (success) {
        state = state.copyWith(productDetail: AsyncValue.data(success));
      },
      (error) {
        state = state.copyWith(
          productDetail: AsyncValue.error(error, error.stackTrace),
        );
      },
    );
  }

  void addToCart() async {
    final userId = await ref
        .read(
          settingControllerProvider.notifier,
        )
        .getUserIdFromBox();

    final productDetail = state.productDetail.value;

    final item = {
      'user_id': userId,
      'product_id': productDetail?.id,
      'product_name': productDetail?.name,
      'short_description': productDetail?.shortDescription,
      'qty': state.quantity,
      'price': productDetail?.price,
      'discounted_price': productDetail?.discountedPrice,
      'discount': productDetail?.discount,
      'line_amount': _calculateLineAmount()
    };

    ref.read(cartControllerProvider.notifier).addToCart(item);
  }

  double _calculateLineAmount() {
    double discount = state.productDetail.value?.discount ?? 0.0;
    double discountedPrice = state.productDetail.value?.discountedPrice ?? 0.0;
    final price = state.productDetail.value?.price ?? 0.0;
    final qty = state.quantity;

    if (discount > 0.0) {
      return qty * discountedPrice;
    }

    return qty * price;
  }

  void incrementQty() {
    state = state.copyWith(quantity: state.quantity + 1);
  }

  void decrementQty() {
    state = state.copyWith(quantity: state.quantity - 1);
  }
}
