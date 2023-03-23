import '../dto/cart_delete_response.dart';
import '../dto/cart_list_response.dart';
import '../dto/cart_response.dart';

abstract class ICartRepository {
  Future<CartListResponse> getUserCart(int id);

  Future<CartResponse> addToCart(Map<String, dynamic> body);

  Future<CartResponse> updateCart(Map<String, dynamic> queries);

  Future<CartDeleteResponse> deleteFromCart(int id);
}
