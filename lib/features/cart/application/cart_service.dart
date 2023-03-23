import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/common/app_const_data/app_const_data.dart';

import '../../../common/provider/currency_code_provider.dart';
import '../../../common/provider/currency_formatter.dart';
import '../../../core/exception/failure.dart';
import '../data/dto/cart_list_response.dart';
import '../data/dto/cart_response.dart';
import '../data/repository/cart_repository.dart';
import '../data/repository/icart_repository.dart';
import '../domain/model/add_to_cart_model.dart';
import '../domain/model/cart_delete_model.dart';
import '../domain/model/cart_item.dart';
import '../domain/model/cart_model.dart';
import 'icart_service.dart';

final cartServiceProvider = Provider<ICartService>((ref) {
  final cartRepository = ref.watch(cartRepositoryProvider);
  const baseUrl = AppConstData.BaseURL;

  return CartService(cartRepository, baseUrl, ref);
});

class CartService implements ICartService {
  final ICartRepository _cartRepository;
  final String _baseUrl;
  final Ref _ref;

  CartService(this._cartRepository, this._baseUrl, this._ref);

  @override
  Future<Result<AddToCartModel, Failure>> addToCart(
      Map<String, dynamic> body) async {
    try {
      final response = await _cartRepository.addToCart(body);
      final result = mapToAddToCartModel(response);

      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<CartDeleteModel, Failure>> deleteFromCart(int id) async {
    try {
      final response = await _cartRepository.deleteFromCart(id);
      final result = CartDeleteModel(
        deleted: response.deleted,
        badgeCount: response.badgeCount,
        formattedCartTotal: formatPrice(
          _ref.read(currencyCodeProvider.notifier).state,
          response.cartTotal.toString(),
        ),
      );

      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<CartModel, Failure>> getUserCart(int id) async {
    try {
      final response = await _cartRepository.getUserCart(id);
      final result = mapToCartModel(response);

      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<AddToCartModel, Failure>> updateCart(
      Map<String, dynamic> queries) async {
    try {
      final response = await _cartRepository.updateCart(queries);
      final result = mapToAddToCartModel(response);

      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  AddToCartModel mapToAddToCartModel(CartResponse response) {
    return AddToCartModel(
      cartItem: CartItem(
        id: int.parse(response.data.id),
        userId: int.parse(response.data.userId),
        productId: int.parse(response.data.productId),
        productName: response.data.productName,
        shortDescription: response.data.shortDescription,
        qty: int.parse(response.data.qty),
        price: double.parse(response.data.price),
        formattedPrice: formatPrice(
          response.data.currency,
          response.data.price,
        ),
        discount: double.parse(response.data.discount),
        discountedPrice: double.parse(response.data.discountedPrice),
        formattedDiscount:
            double.parse(response.data.discount).toStringAsFixed(0),
        formattedDiscountedPrice: formatPrice(
          response.data.currency,
          response.data.discountedPrice,
        ),
        lineAmount: double.parse(response.data.lineAmount),
        thumbnail: '$_baseUrl${response.data.thumbnail}',
      ),
      formattedTotal: formatPrice(
        response.data.currency,
        response.cartTotal.toString(),
      ),
      badgeCount: response.badgeCount,
    );
  }

  CartModel mapToCartModel(CartListResponse response) {
    String currency = '';
    if (response.data.isNotEmpty) {
      currency = response.data.map((e) => e.currency).first;
      _ref.read(currencyCodeProvider.notifier).state = currency;
    }

    return CartModel(
      cartItem: response.data
          .map(
            (e) => CartItem(
              id: int.parse(e.id),
              userId: int.parse(e.userId),
              productId: int.parse(e.productId),
              productName: e.productName,
              shortDescription: e.shortDescription,
              qty: int.parse(e.qty),
              price: double.parse(e.price),
              formattedPrice: formatPrice(
                currency,
                e.price,
              ),
              discount: double.parse(e.discount),
              discountedPrice: double.parse(e.discountedPrice),
              formattedDiscount: double.parse(e.discount).toStringAsFixed(0),
              formattedDiscountedPrice: formatPrice(
                e.currency,
                e.discountedPrice,
              ),
              lineAmount: double.parse(e.lineAmount),
              thumbnail: '$_baseUrl${e.thumbnail}',
            ),
          )
          .toList(),
      formattedTotal: formatPrice(
        currency,
        response.cartTotal.toString(),
      ),
      badgeCount: response.badgeCount,
    );
  }

  String formatPrice(String name, String price) {
    return _ref
        .read(currencyFormatterProvider(name))
        .format(double.parse(price));
  }
}
