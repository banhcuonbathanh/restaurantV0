import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/core/remote/network_service.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/dto/brand/home_brand_response.dart';
import 'package:restauranttdd0/features/home/data/dto/category/home_category_response.dart';
import 'package:restauranttdd0/features/home/data/dto/product/home_featured_product_response.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

final homeApiServiceProvider = Provider<HomeApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return HomeApiService(dio);
});

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) => _HomeApiService(dio);
  @GET('api/v1/banner/getHomeBannerSlider')
  Future<List<HomeBannerResponse>> getHomeBanner();

  @GET('api/v1/category/getCategories')
  Future<List<HomeCategoryResponse>> getCategories();

  @GET('api/v1/brand/getBrands')
  Future<List<HomeBrandResponse>> getBrands();

  @GET('api/v1/product/featuredProduct')
  Future<List<HomeFeaturedProductResponse>> getFeatureProduct();
}

final homeApiServiceTestProvider = Provider<HomeApiServiceTest>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return HomeApiServiceTest(dio);
});

class HomeApiServiceTest {
  final Dio dio;

  HomeApiServiceTest(this.dio);

  Future<List<HomeFeaturedProductResponse>> getFeatureProductTest() async {
    try {
      final response = await dio
          .get('https://bazar.rdewan.dev/api/v1/product/featuredProduct');

      return listFeaturedProductFromJson(response.data);
    } on DioError catch (e) {
      throw Exception(' failed to create post');
    }
  }

  Future<HomeFeaturedProductResponse> getOne({
    required String categoryId,
  }) async {
    // var formData = FormData.fromMap({
    //   'categoryId': categoryId,
    // });
    try {
      final response =
          await dio.post('http://127.0.0.1:3000/category/getone/', data: {
        'categoryId': categoryId,
      });

      return HomeFeaturedProductResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(' failed to create post');
    }
  }
}
