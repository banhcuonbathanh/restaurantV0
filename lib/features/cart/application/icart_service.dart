import 'package:multiple_result/multiple_result.dart';

import '../../../core/exception/failure.dart';
import '../domain/model/add_to_cart_model.dart';
import '../domain/model/cart_delete_model.dart';
import '../domain/model/cart_model.dart';

abstract class ICartService {
  Future<Result<CartModel, Failure>> getUserCart(int id);

  Future<Result<AddToCartModel, Failure>> addToCart(Map<String, dynamic> body);

  Future<Result<AddToCartModel, Failure>> updateCart(
      Map<String, dynamic> queries);

  Future<Result<CartDeleteModel, Failure>> deleteFromCart(int id);
}
