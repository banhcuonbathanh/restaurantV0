import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/core/remote/network_service.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/dto/brand/home_brand_response.dart';
import 'package:restauranttdd0/features/home/data/dto/category/home_category_response.dart';
import 'package:restauranttdd0/features/home/data/dto/product/home_featured_product_response.dart';
import 'package:retrofit/http.dart';

import '../dto/banner/search_banner_response.dart';
import '../dto/brand/search_brand_response.dart';
import '../dto/category/search_category_response.dart';
import '../dto/product/search_featured_product_response.dart';
part 'search_api_service.g.dart';

final searchApiServiceProvider = Provider<SearchApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SearchApiService(dio);
});

@RestApi()
abstract class SearchApiService {
  factory SearchApiService(Dio dio) => _SearchApiService(dio);
  @GET('api/v1/banner/getHomeBannerSlider')
  Future<List<SearchBannerResponse>> getBanner();

  @GET('api/v1/category/getCategories')
  Future<List<SearchCategoryResponse>> getCategories();

  @GET('api/v1/brand/getBrands')
  Future<List<SearchBrandResponse>> getBrands();

  @GET('api/v1/product/featuredProduct')
  Future<List<SearchFeaturedProductResponse>> getFeatureProduct();
}

// final homeApiServiceTestProvider = Provider<SearchApiServiceTest>((ref) {
//   final dio = ref.watch(networkServiceProvider);
//   return SearchApiServiceTest(dio);
// });

// class HomeApiServiceTest {
//   final Dio dio;

//   HomeApiServiceTest(this.dio);

//   Future<List<HomeFeaturedProductResponse>> getFeatureProductTest() async {
//     try {
//       final response = await dio
//           .get('https://bazar.rdewan.dev/api/v1/product/featuredProduct');

//       return SearchFeaturedProductFromJson(response.data);
//     } on DioError catch (e) {
//       throw Exception(' failed to create post');
//     }
//   }

//   Future<HomeFeaturedProductResponse> getOne({
//     required String categoryId,
//   }) async {
//     // var formData = FormData.fromMap({
//     //   'categoryId': categoryId,
//     // });
//     try {
//       final response =
//           await dio.post('http://127.0.0.1:3000/category/getone/', data: {
//         'categoryId': categoryId,
//       });

//       return HomeFeaturedProductResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       throw Exception(' failed to create post');
//     }
//   }
// }
