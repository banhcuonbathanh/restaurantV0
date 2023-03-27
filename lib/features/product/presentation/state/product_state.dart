import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/provider/utility_provider/model.dart';

import '../../domain/models/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(true) bool isLoading,
    @Default(false) bool isFetching,
    @Default(0) int currentPage,
    @Default(0) int totalPage,
    @Default(0) int total,
    @Default([]) List<Product> products,
    @Default([]) List<String> categories,
    @Default([]) List<String> brands,
    @Default(null) CategoryOnScreenModel? categoryOnScreen,
    @Default([]) List<ProductInformation> productInformation,
    String? errorMsg,
    @Default(true) bool isShowProductOnRightThumbView,
    @Default(true) bool isShowRestaurantOnLeftThumbView,
  }) = _ProductState;
}

class CategoryOnScreenModel {
  final String categoryOnScreen;
  final int categoryIndex;

  CategoryOnScreenModel(
      {required this.categoryOnScreen, required this.categoryIndex});
}
