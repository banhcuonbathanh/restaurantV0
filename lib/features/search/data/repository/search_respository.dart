import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/core/exception/mixin/dio_exception_mixin.dart';
import 'package:restauranttdd0/features/home/data/api/home_api_service.dart';
import 'package:restauranttdd0/features/home/data/dto/product/home_featured_product_response.dart';
import 'package:restauranttdd0/features/home/data/dto/category/home_category_response.dart';
import 'package:restauranttdd0/features/home/data/dto/brand/home_brand_response.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/repository/ihome_respository.dart';

import '../api/search_api_service.dart';
import '../dto/banner/search_banner_response.dart';
import '../dto/brand/search_brand_response.dart';
import '../dto/category/search_category_response.dart';
import '../dto/product/search_featured_product_response.dart';
import 'isearch_respository.dart';

final searchRepositoryProvider = Provider<ISearchRespository>((ref) {
  final searchApiService = ref.watch(searchApiServiceProvider);
  return SearchRespository(searchApiService);
});

class SearchRespository with DioExceptionMixin implements ISearchRespository {
  final SearchApiService _searchApiService;

  SearchRespository(this._searchApiService);
  @override
  Future<List<SearchBannerResponse>> getSearchBanner() async {
    return await callApi(() => _searchApiService.getBanner());
  }

  @override
  Future<List<SearchBrandResponse>> getSearchBrand() async {
    return await callApi(() => _searchApiService.getBrands());
  }

  @override
  Future<List<SearchCategoryResponse>> getSearchCategory() async {
    return await callApi(() => _searchApiService.getCategories());
  }

  @override
  Future<List<SearchFeaturedProductResponse>> getSearchFeaturedProduct() async {
    return await callApi(() => _searchApiService.getFeatureProduct());
  }
}
