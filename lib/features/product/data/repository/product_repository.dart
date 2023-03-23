import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exception/mixin/dio_exception_mixin.dart';
import '../api/product_api_service.dart';
import '../dto/response/product_detail_response.dart';
import '../dto/response/product_response.dart';
import 'iproduct_repository.dart';

part 'product_repository.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final productApiService = ref.watch(productApiServiceProvider);

  return ProductRepository(productApiService);
}

class ProductRepository with DioExceptionMixin implements IProductRepository {
  final ProductApiService _productApiService;

  ProductRepository(this._productApiService);

  @override
  Future<ProductResponse> getProducts(Map<String, dynamic> query) async {
    return callApi<ProductResponse>(
        () => _productApiService.getProducts(query));
  }

  @override
  Future<ProductDetailResponse> getProduct(int id) {
    return callApi<ProductDetailResponse>(
        () => _productApiService.getProduct(id));
  }
}
