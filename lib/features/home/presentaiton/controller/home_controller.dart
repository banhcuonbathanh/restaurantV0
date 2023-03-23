import 'package:restauranttdd0/features/home/application/home_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/home_state.dart';
part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    return const HomeState();
  }

  void int() {
    Future.wait([
      _getHomeBanners(),
      _getHomeCategory(),
      _getBrands(),
      _getFeatureProduct(),
    ]);
  }

  Future<void> _getHomeBanners() async {
    final service = ref.read(homeServiceProvider);
    final result = await service.getBanner();
    result.when((success) {
      state = state.copyWith(banners: AsyncData(success));
    }, (error) {
      state = state.copyWith(banners: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getHomeCategory() async {
    final service = ref.read(homeServiceProvider);
    final result = await service.getCategory();
    result.when((success) {
      state = state.copyWith(categories: AsyncData(success));
    }, (error) {
      state = state.copyWith(categories: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getBrands() async {
    final service = ref.read(homeServiceProvider);
    final result = await service.getBrand();
    result.when((success) {
      state = state.copyWith(brands: AsyncData(success));
    }, (error) {
      state = state.copyWith(brands: AsyncError(error, error.stackTrace));
    });
  }

  Future<void> _getFeatureProduct() async {
    final service = ref.read(homeServiceProvider);

    final result = await service.getFeaturedProduct();
    result.when((success) {
      state = state.copyWith(feartureProduct: AsyncData(success));
    }, (error) {
      state =
          state.copyWith(feartureProduct: AsyncError(error, error.stackTrace));
    });
  }
}
