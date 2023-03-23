import 'package:multiple_result/multiple_result.dart';

import '../../../core/exception/failure.dart';
import '../domain/models/product_detail_model.dart';
import '../domain/models/product_model.dart';

abstract class IProductService {
  Future<Result<ProductModel, Failure>> getProducts(Map<String, dynamic> query);
  Future<Result<ProductDetailModel, Failure>> getProduct(int id);
}
