import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/remote/network_service.dart';
import '../dto/response/product_detail_response.dart';
import '../dto/response/product_response.dart';

part 'product_api_service.g.dart';

/// Provide the instance on ProductApiService(dio)
final productApiServiceProvider =
    Provider.autoDispose<ProductApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return ProductApiService(dio);
});

@RestApi(baseUrl: 'https://bazar.rdewan.dev/')
abstract class ProductApiService {
  factory ProductApiService(Dio dio) => _ProductApiService(dio);

  @GET('api/v1/product/getProducts')
  Future<ProductResponse> getProducts(@Queries() Map<String, dynamic> query);

  @GET('api/v1/product/getProduct/{id}')
  Future<ProductDetailResponse> getProduct(@Path() int id);
}
