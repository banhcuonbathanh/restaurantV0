import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/core/exception/mixin/dio_exception_mixin.dart';
import 'package:restauranttdd0/features/home/data/api/home_api_service.dart';
import 'package:restauranttdd0/features/home/data/dto/product/home_featured_product_response.dart';
import 'package:restauranttdd0/features/home/data/dto/category/home_category_response.dart';
import 'package:restauranttdd0/features/home/data/dto/brand/home_brand_response.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/repository/ihome_respository.dart';

final homeRepositoryProvider = Provider<IHomeRespository>((ref) {
  final homeApiService = ref.watch(homeApiServiceProvider);
  return HomeRespository(homeApiService);
});

class HomeRespository with DioExceptionMixin implements IHomeRespository {
  final HomeApiService _homeApiService;

  HomeRespository(this._homeApiService);
  @override
  Future<List<HomeBannerResponse>> getHomeBanner() async {
    return await callApi(() => _homeApiService.getHomeBanner());
  }

  @override
  Future<List<HomeBrandResponse>> getHomeBrand() async {
    return await callApi(() => _homeApiService.getBrands());
  }

  @override
  Future<List<HomeCategoryResponse>> getHomeCategory() async {
    return await callApi(() => _homeApiService.getCategories());
  }

  @override
  Future<List<HomeFeaturedProductResponse>> getHomeFeaturedProduct() async {
    return await callApi(() => _homeApiService.getFeatureProduct());
  }
}
