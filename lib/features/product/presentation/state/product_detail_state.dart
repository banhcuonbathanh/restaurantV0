import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/product_detail_model.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(AsyncValue.loading()) AsyncValue<ProductDetailModel> productDetail,
    @Default(1) final int quantity,
  }) = _ProductDetailState;
}
