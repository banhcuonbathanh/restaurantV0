import '../../data/dto/response/product_response.dart';
import '../models/product_model.dart';

abstract class ProductModelMapper {
  ProductModel mapToProductModel(
      ProductResponse response, Map<String, dynamic> query);
}
