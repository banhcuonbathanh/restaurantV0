import '../dto/response/product_detail_response.dart';
import '../dto/response/product_response.dart';

abstract class IProductRepository {
  Future<ProductResponse> getProducts(Map<String, dynamic> query);
  Future<ProductDetailResponse> getProduct(int id);
}
