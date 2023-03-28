import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_categories.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/provider/utility_provider/utilityProvider.dart';
import '../../../../../common/styles/dimens.dart';
import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';
import '../../state/product_state.dart';

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
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestaurantCategoryLeftView(
                  appScroller: widget.appScroller,
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .watch(productControllerProvider.notifier)
                        .isShownRestaurantCategoryOnLeftThumbView();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 100,
                    child: Text('X'),
                  ),
                )
              ],
            ),
    );
  }
}

class RestaurantCategoryLeftView extends ConsumerStatefulWidget {
  const RestaurantCategoryLeftView({required this.appScroller, super.key});
  final ScrollController appScroller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantCategoryLeftViewState();
}

class _RestaurantCategoryLeftViewState
    extends ConsumerState<RestaurantCategoryLeftView> {
  @override
  Widget build(BuildContext context) {
    final productcontroller = ref.watch(productControllerProvider);
    final categoriesData = productcontroller.categories;
    final categoryOnScreen = productcontroller.categoryOnScreen;
    final widgetRestaurantConfig =
        ref.watch(AbstractUtilityProvider.widgetRestaurantConfigProvider);
    return Container(
      color: Colors.green.shade100,
      height: 200,
      width: 100,
      child: ListView.builder(
          itemCount: categoriesData.length,
          itemBuilder: (context, index) {
            final category = categoriesData[index];

            final configOfCategoryRestaurant = widgetRestaurantConfig[category];

            return GestureDetector(
              onTap: () {
                if (configOfCategoryRestaurant != null) {
                  widget.appScroller.animateTo(
                      configOfCategoryRestaurant.hlafPixcel,
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.linear);

                  ref
                      .read(productControllerProvider.notifier)
                      .updateCategoryOnScreen(
                          newCategoryOnScreen: CategoryOnScreenModel(
                              categoryIndex: index,
                              categoryOnScreen: category));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(kSmall),
                child: GlassmorphicContainerSecondaryStyle(
                  height: WidgetProductsCardConfigData.heightOfProductCategory,
                  width: WidgetProductsCardConfigData.widthOfProductCategory,
                  isPrimary: categoryOnScreen?.categoryOnScreen == category,
                  isGrey: categoryOnScreen?.categoryOnScreen != category,
                  child: Text(category,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
              ),
            );
          }),
    );
  }
}

class RestaurantCategoryListViewOnLeft extends StatelessWidget {
  const RestaurantCategoryListViewOnLeft({
    super.key,
    required this.widget,
  });

  final RestaurantLeftThumbView widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetProductsCardConfigData.rightThumbPadViewHeight,
      width: WidgetProductsCardConfigData.rightThumbViewWidth + 200,
      child: ProductCategories(
        appScroller: widget.appScroller,
      ),
    );
  }
}
