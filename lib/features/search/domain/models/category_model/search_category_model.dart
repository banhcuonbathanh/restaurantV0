import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_category_model.freezed.dart';

@freezed
class SearchCategoryModel with _$SearchCategoryModel {
  const factory SearchCategoryModel({
    required int id,
    required String name,
    required String description,
    required String thumbnail,
    required String image,
    required int isActive,
  }) = _SearchCategoryModel;
}
