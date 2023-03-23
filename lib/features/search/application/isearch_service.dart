import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/core/exception/failure.dart';

import '../domain/models/brand_model/search_brand_model.dart';
import '../domain/models/category_model/search_category_model.dart';
import '../domain/models/feartured_product_model/search_feartured_product_model.dart';

abstract class ISearchService {
  Future<Result<List<String>, Failure>> getBanner();

  Future<Result<List<SearchCategoryModel>, Failure>> getCategory();

  Future<Result<List<SearchBrandModel>, Failure>> getBrand();

  Future<Result<List<SearchFeatureProductModel>, Failure>> getFeaturedProduct();
}
