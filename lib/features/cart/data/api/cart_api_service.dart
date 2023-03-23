import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/remote/network_service.dart';
import '../dto/cart_delete_response.dart';
import '../dto/cart_list_response.dart';
import '../dto/cart_response.dart';

part 'cart_api_service.g.dart';

final cartApiServiceProvider = Provider<CartApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CartApiService(dio);
});

@RestApi()
abstract class CartApiService {
  factory CartApiService(Dio dio) => _CartApiService(dio);

  @GET('api/v1/cart/getUserCart/{id}')
  Future<CartListResponse> getUserCart(@Path() int id);

  @POST('api/v1/cart/addToCart')
  Future<CartResponse> addToCart(@Body() Map<String, dynamic> body);

  @PUT('api/v1/cart/update')
  Future<CartResponse> updateCart(@Queries() Map<String, dynamic> queries);

  @DELETE('api/v1/cart/delete')
  Future<CartDeleteResponse> deleteFromCart(@Query('id') int id);
}
