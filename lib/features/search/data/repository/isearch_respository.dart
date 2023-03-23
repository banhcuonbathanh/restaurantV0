import '../dto/banner/search_banner_response.dart';
import '../dto/brand/search_brand_response.dart';
import '../dto/category/search_category_response.dart';
import '../dto/product/search_featured_product_response.dart';

abstract class ISearchRespository {
  Future<List<SearchBannerResponse>> getSearchBanner();

  Future<List<SearchCategoryResponse>> getSearchCategory();

  Future<List<SearchBrandResponse>> getSearchBrand();

  Future<List<SearchFeaturedProductResponse>> getSearchFeaturedProduct();
}
