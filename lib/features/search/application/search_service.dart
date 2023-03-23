import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restauranttdd0/common/app_const_data/app_const_data.dart';
import 'package:restauranttdd0/core/exception/failure.dart';

import 'package:restauranttdd0/features/home/application/ihome_service.dart';
import 'package:restauranttdd0/features/home/data/dto/banner/home_banner_response.dart';
import 'package:restauranttdd0/features/home/data/repository/home_respository.dart';

import '../../../common/provider/currency_formatter.dart';
import '../data/dto/banner/search_banner_response.dart';
import '../data/dto/brand/search_brand_response.dart';
import '../data/dto/category/search_category_response.dart';
import '../data/dto/product/search_featured_product_response.dart';
import '../data/repository/isearch_respository.dart';
import '../data/repository/search_respository.dart';
import '../domain/models/brand_model/search_brand_model.dart';
import '../domain/models/category_model/search_category_model.dart';
import '../domain/models/feartured_product_model/search_feartured_product_model.dart';
import 'isearch_service.dart';

final searchServiceProvider = Provider<ISearchService>((ref) {
  final _searchRespository = ref.watch(searchRepositoryProvider);
  final _baseUrl = AppConstData.BaseURL;
  return SearchService(_searchRespository, _baseUrl, ref);
});

class SearchService implements ISearchService {
  final ISearchRespository _searchRespository;
  final String _baseUrl;
  final Ref _ref;
  SearchService(this._searchRespository, this._baseUrl, this._ref);
  @override
  Future<Result<List<SearchBrandModel>, Failure>> getBrand() async {
    try {
      final response = await _searchRespository.getSearchBrand();

      final result = _mapToBrandModel(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<SearchFeatureProductModel>, Failure>>
      getFeaturedProduct() async {
    try {
      final response = await _searchRespository.getSearchFeaturedProduct();

      final result = _mapToFeatureProduct(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<String>, Failure>> getBanner() async {
    try {
      final response = await _searchRespository.getSearchBanner();
      final result = _mapToBanner(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  @override
  Future<Result<List<SearchCategoryModel>, Failure>> getCategory() async {
    try {
      final response = await _searchRespository.getSearchCategory();
      final result = _mapToCategory(response);
      return Success(result);
    } on Failure catch (_error) {
      return Error(_error);
    }
  }

  List<SearchBrandModel> _mapToBrandModel(List<SearchBrandResponse> response) {
    return response
        .map((e) => SearchBrandModel(
            description: e.description,
            id: e.id,
            image: '$_baseUrl${e.image}',
            isActive: int.parse(e.isActive),
            name: e.name,
            thumbnail: '$_baseUrl${e.thumbnail}'))
        .toList();
  }

  List<SearchCategoryModel> _mapToCategory(
      List<SearchCategoryResponse> response) {
    return response
        .map((e) => SearchCategoryModel(
            description: e.description,
            id: e.id,
            image: '$_baseUrl${e.image}',
            isActive: int.parse(e.isActive),
            name: e.name,
            thumbnail: '$_baseUrl${e.thumbnail}'))
        .toList();
  }

  List<SearchFeatureProductModel> _mapToFeatureProduct(
      List<SearchFeaturedProductResponse> response) {
    return response
        .map((e) => SearchFeatureProductModel(
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

  List<String> _mapToBanner(List<SearchBannerResponse> response) {
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