import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restauranttdd0/features/search/domain/models/feartured_product_model/search_feartured_product_model.dart';

import '../../domain/models/brand_model/search_brand_model.dart';
import '../../domain/models/category_model/search_category_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(AsyncValue.loading()) final AsyncValue<List<String>> banners,
    @Default(AsyncValue.loading())
        final AsyncValue<List<SearchBrandModel>> brands,
    @Default(AsyncValue.loading())
        final AsyncValue<List<SearchCategoryModel>> categories,
    @Default(AsyncValue.loading())
        final AsyncValue<List<SearchFeatureProductModel>> feartureProduct,
  }) = _SearchState;
}
