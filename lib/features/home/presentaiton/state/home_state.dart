import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restauranttdd0/features/home/domain/models/brand_model/brand_model.dart';
import 'package:restauranttdd0/features/home/domain/models/category_model/category_model.dart';
import 'package:restauranttdd0/features/home/domain/models/feartured_product_model/feartured_product_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncValue.loading()) final AsyncValue<List<String>> banners,
    @Default(AsyncValue.loading()) final AsyncValue<List<BrandModel>> brands,
    @Default(AsyncValue.loading())
        final AsyncValue<List<CategoryModel>> categories,
    @Default(AsyncValue.loading())
        final AsyncValue<List<FeatureProductModel>> feartureProduct,
  }) = _HomeState;
}
