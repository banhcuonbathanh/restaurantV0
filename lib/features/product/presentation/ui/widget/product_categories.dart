import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/provider/utility_provider/model.dart';
import '../../../../../common/provider/utility_provider/utilityProvider.dart';

import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';
import '../../state/product_state.dart';

class ProductCategories extends ConsumerStatefulWidget {
  final ScrollController appScroller;
  const ProductCategories({required this.appScroller, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCategoriesState();
}

class _ProductCategoriesState extends ConsumerState<ProductCategories> {
  @override
  Widget build(BuildContext context) {
    final productcontroller = ref.watch(productControllerProvider);
    final ScrollController categoryScrollController1 = ScrollController();
    final categoriesData = productcontroller.categories;
    // final categoriesData = widget.state.categories;
    final categoryOnScreen = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    final fetchingState = ref
        .watch(productControllerProvider.select((value) => value.isFetching));
    final widgetPara =
        ref.watch(AbstractUtilityProvider.widgetRestaurantConfigProvider);
//---------
    categoryScrollController1.addListener(() {
      final maxScrollExtent =
          categoryScrollController1.position.maxScrollExtent;

      if (categoryScrollController1.position.pixels >= maxScrollExtent) {
        final currentPage = ref.read(productControllerProvider).currentPage;
        final totalPage = ref.read(productControllerProvider).totalPage;

        if (currentPage < totalPage) {
          ref
              .read(productControllerProvider.notifier)
              .getProductstest(pageNumber: currentPage + 1);
        }
      }
    });
//--------
    final productsOfAllRestaurantConfig =
        ref.watch(productsOfAllRestaurantConfigProvider);

    return Row(
      children: [
        Flexible(
          flex: 12,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              controller: categoryScrollController1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoriesData.length,
              itemBuilder: (context, index) {
                final category = categoriesData[index];
                final test = widgetPara[category];
                // final name = ref.watch(
                //     AbstractUtilityProvider.titleShowingOnProductCategoriesList);
//--------------------------

                final ProductsConfigEachRestaurantMode?
                    productsConfigEachRestaurant =
                    productsOfAllRestaurantConfig[category];

                final Map<int, ProductsOfEachRowConfig>? productIndexConfig =
                    productsConfigEachRestaurant?.productInformationMap;
//------------------
//--------------------------

                if (test != null) {
                  widget.appScroller.addListener(() {
                    if (widget.appScroller.position.userScrollDirection ==
                        ScrollDirection.reverse) {
                      if (widget.appScroller.position.pixels >
                          test.previousHalfPixcel) {
                        if (widget.appScroller.position.pixels <
                            test.hlafPixcel) {
                          // setState(() {
                          //   isOnScreen = test.name;
                          // });

                          ref
                              .read(productControllerProvider.notifier)
                              .updateCategoryOnScreen(
                                  newCategoryOnScreen: CategoryOnScreenModel(
                                      categoryIndex: index,
                                      categoryOnScreen: test.name));

                          if (productsConfigEachRestaurant != null) {
                            for (int i = 0;
                                i < productsConfigEachRestaurant.numberOfRow;
                                i++) {
                              final productIndexConfigindex =
                                  productIndexConfig?[i];
                              if (productIndexConfigindex != null) {
                                if (widget.appScroller.position.pixels >
                                    productIndexConfigindex
                                        .productStartPixcel) {
                                  if (widget.appScroller.position.pixels <
                                      productIndexConfigindex
                                          .productEndPixcel) {
                                    ref
                                        .read(
                                            productControllerProvider.notifier)
                                        .updateThumbProduct(
                                            thumProduct: productIndexConfigindex
                                                .productInformation);
                                  }
                                }
                              }
                            }
                          }

                          // ref
                          //     .read(AbstractUtilityProvider
                          //         .titleShowingOnProductCategoriesList.notifier)
                          //     .titleOnScreen(title: test.name);
                        }
                      }
                    }

                    if (widget.appScroller.position.userScrollDirection ==
                        ScrollDirection.forward) {
                      if (widget.appScroller.position.pixels <
                          test.hlafPixcel) {
                        if (widget.appScroller.position.pixels >
                            test.previousHalfPixcel) {
                          ref
                              .read(productControllerProvider.notifier)
                              .updateCategoryOnScreen(
                                  newCategoryOnScreen: CategoryOnScreenModel(
                                      categoryIndex: index,
                                      categoryOnScreen: test.name));

                          //---------------------------

                          if (productsConfigEachRestaurant != null) {
                            for (int i = 0;
                                i < productsConfigEachRestaurant.numberOfRow;
                                i++) {
                              final productIndexConfigindex =
                                  productIndexConfig?[i];
                              if (productIndexConfigindex != null) {
                                if (widget.appScroller.position.pixels <
                                    productIndexConfigindex.productEndPixcel) {
                                  if (widget.appScroller.position.pixels >
                                      productIndexConfigindex
                                          .productStartPixcel) {
                                    ref
                                        .read(
                                            productControllerProvider.notifier)
                                        .updateThumbProduct(
                                            thumProduct: productIndexConfigindex
                                                .productInformation);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  });
                }
                //---------------------horizontal move
                if (categoryOnScreen?.categoryOnScreen == category) {
                  final double scrollOffset = index * 80 - 155;
                  if (index > 3) {
                    scrollOffset - 80;
                  }
                  Future(() {}).then((value) {
                    categoryScrollController1.animateTo(scrollOffset,
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.linear);
                  });
                }

                //-----------------
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GlassmorphicContainerSecondaryStyle(
                    height:
                        WidgetProductsCardConfigData.heightOfProductCategory,
                    width: WidgetProductsCardConfigData.widthOfProductCategory,
                    isPrimary: categoryOnScreen?.categoryOnScreen == category,
                    isGrey: categoryOnScreen?.categoryOnScreen != category,
                    child: Text(category,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                );
              }),
        ),
        if (!fetchingState) ...[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.more_horiz),
            ),
          ),
        ],
        if (fetchingState) ...[
          const Flexible(
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
        ]
      ],
    );
  }
}
