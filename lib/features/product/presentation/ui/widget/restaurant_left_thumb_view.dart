import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_categories.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';

class RestaurantLeftThumbView extends ConsumerStatefulWidget {
  final ScrollController appScroller;
  const RestaurantLeftThumbView({required this.appScroller, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsDetailListViewState();
}

class _ProductsDetailListViewState
    extends ConsumerState<RestaurantLeftThumbView> {
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    final isShownRestaurant = ref.watch(productControllerProvider
        .select((value) => value.isShowRestaurantOnLeftThumbView));
    // final testData = ProductDetailsRowConfigMode();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: (isShownRestaurant)
          ? GestureDetector(
              onTap: () {
                ref
                    .watch(productControllerProvider.notifier)
                    .isShownRestaurantCategoryOnLeftThumbView();
              },
              child: GlassmorphicContainerSecondaryStyle(
                height: WidgetProductsCardConfigData.rightThumbPadViewHeight,
                width: WidgetProductsCardConfigData.rightThumbViewWidth,
                isPrimary: true,
                isGrey: false,
                child: Text(
                  category == null ? '' : category.categoryOnScreen,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis, color: Colors.black),
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                // ref
                //     .watch(productControllerProvider.notifier)
                //     .isShownRestaurantCategoryOnLeftThumbView();
              },
              child: SizedBox(
                height: WidgetProductsCardConfigData.rightThumbPadViewHeight,
                width: WidgetProductsCardConfigData.rightThumbViewWidth + 200,
                child: ProductCategories(
                  appScroller: widget.appScroller,
                ),
              ),
            ),
    );
  }
}
