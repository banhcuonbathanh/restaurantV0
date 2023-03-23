import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/provider/utility_provider/utilityProvider.dart';
import '../../application/iproduct_service.dart';
import '../../application/product_service.dart';
import '../state/product_state.dart';

/// provide the instance of ProductController
final productControllerProvider =
    StateNotifierProvider.autoDispose<ProductController, ProductState>((ref) {
  final productService = ref.watch(productServiceProvider);

  return ProductController(productService, const ProductState(), ref);
});

class ProductController extends StateNotifier<ProductState> {
  final IProductService _productService;
  final Ref ref;
  ProductController(this._productService, super.state, this.ref);

  void getProducts1() async {
    if (state.isFetching) return;

    state = state.copyWith(isFetching: true);

    final pageNumber = state.currentPage == 0 ? 1 : state.currentPage + 1;
    final query = {'perPage': 20, 'pageNumber': pageNumber};
    final oldProduct = state.products;
    final oldCategories = state.categories;
    final oldBrand = state.brands;
    final result = await _productService.getProducts(query);
    // category

    result.when(
      (success) {
        final newCategories =
            success.products.map((e) => e.category).toSet().toList();

        // get restaurant list in temporary base on category
        ref
            .read(AbstractUtilityProvider.restaurantList1.notifier)
            .getRestaurantList(
                restaurantList: [...oldCategories, ...newCategories]);
        // brands
        final newBrand =
            success.products.map((e) => e.category).toSet().toList();

        final newBrands = state.products.map((e) => e.brand).toSet().toList();
        state = state.copyWith(
          isFetching: false,
          isLoading: false,
          products: [...oldProduct, ...success.products],
          currentPage: success.page.currentPage,
          totalPage: success.page.lastPage,
          total: success.page.total,
          categories: [...oldCategories, ...newCategories],
          brands: [...oldBrand, ...newBrands],
          categoryOnScreen: CategoryOnScreenModel(
            categoryIndex: 0,
            categoryOnScreen: [...oldCategories, ...newCategories][0],
          ),
        );
      },
      (error) {
        state = state.copyWith(
          isFetching: false,
          isLoading: false,
          errorMsg: error.message,
        );
      },
    );
  }

  void updateCategoryOnScreen(
      {required CategoryOnScreenModel newCategoryOnScreen}) {
    // print('state.categoryOnScreen?.categoryOnScreen');
    // print(state.categoryOnScreen?.categoryOnScreen);
    if (newCategoryOnScreen.categoryOnScreen !=
        state.categoryOnScreen?.categoryOnScreen) {
      state = state.copyWith(
        categoryOnScreen: newCategoryOnScreen,
      );
    }
  }

  Future<ProductState> getProductstest({required int pageNumber}) async {
    if (state.isFetching) return state;

    state = state.copyWith(isFetching: true);

    final pageNumber = state.currentPage == 0 ? 1 : state.currentPage + 1;
    final query = {'perPage': 20, 'pageNumber': pageNumber};
    final oldProduct = state.products;
    final oldCategories = state.categories;
    final oldBrand = state.brands;
    final result = await _productService.getProducts(query);
    // category

    result.when(
      (success) {
        final newCategories =
            success.products.map((e) => e.category).toSet().toList();

        // get restaurant list in temporary base on category
        ref
            .read(AbstractUtilityProvider.restaurantList1.notifier)
            .getRestaurantList(
                restaurantList: [...oldCategories, ...newCategories]);
        // brands
        final newBrand =
            success.products.map((e) => e.category).toSet().toList();

        final newBrands = state.products.map((e) => e.brand).toSet().toList();
        state = state.copyWith(
          isFetching: false,
          isLoading: false,
          products: [...oldProduct, ...success.products],
          currentPage: success.page.currentPage,
          totalPage: success.page.lastPage,
          total: success.page.total,
          categories: [...oldCategories, ...newCategories],
          brands: [...oldBrand, ...newBrands],
          categoryOnScreen: CategoryOnScreenModel(
            categoryIndex: 0,
            categoryOnScreen: [...oldCategories, ...newCategories][0],
          ),
        );
      },
      (error) {
        state = state.copyWith(
          isFetching: false,
          isLoading: false,
          errorMsg: error.message,
        );
      },
    );

    return state;
  }
}
