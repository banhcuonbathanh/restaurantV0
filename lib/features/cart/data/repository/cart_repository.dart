import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/exception/mixin/dio_exception_mixin.dart';
import '../api/cart_api_service.dart';
import '../dto/cart_delete_response.dart';
import '../dto/cart_list_response.dart';
import '../dto/cart_response.dart';
import 'icart_repository.dart';

final cartRepositoryProvider = Provider<ICartRepository>((ref) {
  final cartApiService = ref.watch(cartApiServiceProvider);

  return CartRepository(cartApiService);
});

class CartRepository with DioExceptionMixin implements ICartRepository {
  final CartApiService _cartApiService;

  CartRepository(this._cartApiService);

  @override
  Future<CartResponse> addToCart(Map<String, dynamic> body) {
    return callApi<CartResponse>(() => _cartApiService.addToCart(body));
  }

  @override
  Future<CartDeleteResponse> deleteFromCart(int id) {
    return callApi<CartDeleteResponse>(
        () => _cartApiService.deleteFromCart(id));
  }

  @override
  Future<CartListResponse> getUserCart(int id) {
    return callApi<CartListResponse>(() => _cartApiService.getUserCart(id));
  }

  @override
  Future<CartResponse> updateCart(Map<String, dynamic> queries) {
    return callApi<CartResponse>(() => _cartApiService.updateCart(queries));
  }
}
