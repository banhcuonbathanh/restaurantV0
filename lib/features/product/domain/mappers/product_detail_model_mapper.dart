import '../../data/dto/response/product_detail_response.dart';
import '../models/product_detail_model.dart';

abstract class ProductDetailModelMapper {
  ProductDetailModel mapToProductDetailModel(ProductDetailResponse response);
}
