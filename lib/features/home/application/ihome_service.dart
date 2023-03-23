import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/core/exception/failure.dart';
import 'package:restauranttdd0/features/home/domain/models/brand_model/brand_model.dart';
import 'package:restauranttdd0/features/home/domain/models/category_model/category_model.dart';
import 'package:restauranttdd0/features/home/domain/models/feartured_product_model/feartured_product_model.dart';

abstract class IHomeService {
  Future<Result<List<String>, Failure>> getBanner();

  Future<Result<List<CategoryModel>, Failure>> getCategory();

  Future<Result<List<BrandModel>, Failure>> getBrand();

  Future<Result<List<FeatureProductModel>, Failure>> getFeaturedProduct();
}
