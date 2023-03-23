import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/provider/search_provider/search_provider.dart';
import '../../application/search_service.dart';
import '../../domain/models/brand_model/search_brand_model.dart';
import '../../domain/models/category_model/search_category_model.dart';
import '../../domain/models/feartured_product_model/search_feartured_product_model.dart';
import '../state/search_state.dart';
part 'search_controller.g.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  SearchState build() {
    return const SearchState();
  }

  void int() {
    Future.wait([
      // _getSearchBanners(),
      _getSearchCategory(),
      _getSearchBrands(),
      _getSearchFeatureProduct(),
    ]);
  }

  Future<void> _getSearchBanners() async {
    final service = ref.read(searchServiceProvider);
    final result = await service.getBanner();
    final seachWords = ref.watch(searchProvider);
    result.when((success) {
      List<String> filterBaner = [];

      if (seachWords != '' && seachWords != null) {
        filterBaner = success
            .where((element) => element
                .toLowerCase()
                .contains(seachWords.toLowerCase().toString()))
            .toList();
      }
      state = state.copyWith(banners: AsyncData(filterBaner));
    }, (error) {
      state = state.copyWith(banners: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getSearchCategory() async {
    final seachWords = ref.watch(searchProvider);

    final service = ref.read(searchServiceProvider);
    final result = await service.getCategory();
    result.when((success) {
      List<SearchCategoryModel> filterBaner = [];

      if (seachWords != '' && seachWords != null) {
        filterBaner = success
            .where((element) => element.name
                .toLowerCase()
                .contains(seachWords.toLowerCase().toString()))
            .toList();
      }

      state = state.copyWith(categories: AsyncData(filterBaner));
    }, (error) {
      state = state.copyWith(categories: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getSearchBrands() async {
    final service = ref.read(searchServiceProvider);
    final result = await service.getBrand();
    final seachWords = ref.watch(searchProvider);

    result.when((success) {
      List<SearchBrandModel> filterBaner = [];
      if (seachWords != '' && seachWords != null) {
        filterBaner = success
            .where((element) => element.name
                .toLowerCase()
                .contains(seachWords.toLowerCase().toString()))
            .toList();
      }
      state = state.copyWith(brands: AsyncData(filterBaner));
    }, (error) {
      state = state.copyWith(brands: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getSearchFeatureProduct() async {
    final service = ref.read(searchServiceProvider);
    final seachWords = ref.watch(searchProvider);
    final result = await service.getFeaturedProduct();
    result.when((success) {
      List<SearchFeatureProductModel> filterBaner = [];
      if (seachWords != '' && seachWords != null) {
        filterBaner = success
            .where((element) => element.name
                .toLowerCase()
                .contains(seachWords.toLowerCase().toString()))
            .toList();
      }
      state = state.copyWith(feartureProduct: AsyncData(filterBaner));
    }, (error) {
      state =
          state.copyWith(feartureProduct: AsyncError(error, error.stackTrace));
    });
  }
}
