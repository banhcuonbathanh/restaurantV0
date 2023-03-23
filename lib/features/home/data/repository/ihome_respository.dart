import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/dto/brand/home_brand_response.dart';
import 'package:restauranttdd0/features/home/data/dto/category/home_category_response.dart';
import 'package:restauranttdd0/features/home/data/dto/product/home_featured_product_response.dart';

abstract class IHomeRespository {
  Future<List<HomeBannerResponse>> getHomeBanner();

  Future<List<HomeCategoryResponse>> getHomeCategory();

  Future<List<HomeBrandResponse>> getHomeBrand();

  Future<List<HomeFeaturedProductResponse>> getHomeFeaturedProduct();
}
