import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_delete_model.freezed.dart';

@freezed
class CartDeleteModel with _$CartDeleteModel {
  const factory CartDeleteModel({
    required bool deleted,
    required String formattedCartTotal,
    required int badgeCount,
  }) = _CartDeleteModel;
}
