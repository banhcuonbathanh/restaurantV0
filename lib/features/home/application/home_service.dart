import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/common/app_const_data/app_const_data.dart';
import 'package:restauranttdd0/core/exception/failure.dart';

import 'package:restauranttdd0/features/home/application/ihome_service.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/repository/home_respository.dart';
import 'package:restauranttdd0/features/home/data/repository/ihome_respository.dart';
import 'package:restauranttdd0/features/home/domain/models/feartured_product_model/feartured_product_model.dart';
import 'package:restauranttdd0/features/home/domain/models/category_model/category_model.dart';
import 'package:restauranttdd0/features/home/domain/models/brand_model/brand_model.dart';

import '../../../common/provider/currency_formatter.dart';
import '../data/dto/brand/home_brand_response.dart';
import '../data/dto/category/home_category_response.dart';
import '../data/dto/product/home_featured_product_response.dart';

final homeServiceProvider = Provider<IHomeService>((ref) {
  final _homeRespository = ref.watch(homeRepositoryProvider);
  final _baseUrl = AppConstData.BaseURL;
  return HomeService(_homeRespository, _baseUrl, ref);
});

class HomeService implements IHomeService {
  final IHomeRespository _homeRespository;
  final String _baseUrl;
  final Ref _ref;
  HomeService(this._homeRespository, this._baseUrl, this._ref);
  @override
  Future<Result<List<BrandModel>, Failure>> getBrand() async {
    try {
      final response = await _homeRespository.getHomeBrand();

      final result = _mapToBrandModel(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<FeatureProductModel>, Failure>>
      getFeaturedProduct() async {
    try {
      final response = await _homeRespository.getHomeFeaturedProduct();

      final result = _mapToFeatureProduct(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<String>, Failure>> getBanner() async {
    try {
      final response = await _homeRespository.getHomeBanner();
      final result = _mapToBanner(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<CategoryModel>, Failure>> getCategory() async {
    try {
      final response = await _homeRespository.getHomeCategory();
      final result = _mapToCategory(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  List<BrandModel> _mapToBrandModel(List<HomeBrandResponse> response) {
    return response
        .map((e) => BrandModel(
            description: e.description,
            id: e.id,
            image: '$_baseUrl${e.image}',
            isActive: int.parse(e.isActive),
            name: e.name,
            thumbnail: '$_baseUrl${e.thumbnail}'))
        .toList();
  }

  List<CategoryModel> _mapToCategory(List<HomeCategoryResponse> response) {
    return response
        .map((e) => CategoryModel(
            description: e.description,
            id: e.id,
            image: '$_baseUrl${e.image}',
            isActive: int.parse(e.isActive),
            name: e.name,
            thumbnail: '$_baseUrl${e.thumbnail}'))
        .toList();
  }

  List<FeatureProductModel> _mapToFeatureProduct(
      List<HomeFeaturedProductResponse> response) {
    return response
        .map((e) => FeatureProductModel(
              id: int.parse(e.id),
              categoryId: int.parse(e.categoryId),
              brandId: int.parse(e.brandId),
              sku: e.sku,
              name: e.name,
              shortDescription: e.shortDescription,
              longDescription: e.longDescription,
              thumbnail: '$_baseUrl${e.thumbnail}',
              images: '$_baseUrl${e.images}',
              isActive: int.parse(e.isActive),
              price: double.parse(e.price),
              discount: double.parse(e.discount),
              discountedPrice: calculateDiscountedPrice(
                double.parse(e.discount),
                double.parse(e.price),
              ),
              formattedPrice: formatPrice(e.currency, e.price),
              formattedDiscount: double.parse(e.discount).toStringAsFixed(0),
              formattedDiscountedPrice: calculateFormattedDiscountedPrice(
                double.parse(e.discount),
                double.parse(e.price),
                e.currency,
              ),
              currency: e.currency,
              qty: int.parse(e.qty),
              category: e.category,
              brand: e.brand,
            ))
        .toList();
  }

  List<String> _mapToBanner(List<HomeBannerResponse> response) {
    return response.map((e) => '$_baseUrl${e.image}').toList();
  }

  String formatPrice(String name, String price) {
    return _ref
        .read(currencyFormatterProvider(name))
        .format(double.parse(price));
  }

  double calculateDiscountedPrice(
    double discountPercent,
    double price,
  ) {
    return (price - (discountPercent / 100 * price));
  }

  String calculateFormattedDiscountedPrice(
    double discountPercent,
    double price,
    String currency,
  ) {
    return formatPrice(
      currency,
      (price - (discountPercent / 100 * price)).toString(),
    );
  }
}



// class HomeService implements IHomeService {



//   List<HomeBannerResponse> _mapToBrandModel(List<HomeBannerResponse> response) {}
  
//   @override
//   Future<Result<List<BrandModel>, Failure>> getBrand() async {
//  try {
//       final response = await _homeRespository.getHomeBanner();
//       final result = _mapToBrandModel(response);
//     } on Failure catch (_error) {
//       Error(_error);
//     }
//   }
  
//   @override
//   Future<Result<List<FeatureProductModel>, Failure>> getFeaturedProduct() {
//     // TODO: implement getFeaturedProduct
//     throw UnimplementedError();
//   }
  
//   @override
//   Future<Result<List<String>, Failure>> getHomeBanner() {
//     // TODO: implement getHomeBanner
//     throw UnimplementedError();
//   }
  
//   @override
//   Future<Result<List<CategoryModel>, Failure>> getHomeCategory() {
//     // TODO: implement getHomeCategory
//     throw UnimplementedError();
//   }
// }


// try {
//       final response = await _homeRespository.getHomeBanner();
//       final result = _mapToBrandModel(response);
//     } on Failure catch (_error) {
//       Error(_error);
//     }