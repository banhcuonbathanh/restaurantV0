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
  final ProductState state;
  final ScrollController appScroller;
  const ProductCategories(
      {required this.state, required this.appScroller, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCategoriesState();
}

class _ProductCategoriesState extends ConsumerState<ProductCategories> {
  @override
  Widget build(BuildContext context) {
    final productcontroller = ref.watch(productControllerProvider);
    final ScrollController categoryScrollController1 = ScrollController();
    final categoriesData = widget.state.categories;
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
                  final double scrollOffset = index * 80;
                  if (index == 3) {
                    scrollOffset + 80;
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
                    child: GestureDetector(
                      onDoubleTap: () {
                        print('productcontroller');
                        print(productcontroller);
                        print('productcontroller.products.length');
                        print(productcontroller.products.length);
                        productcontroller.products.forEach((element) {
                          print('product name');
                          print(element.name);
                          print('product category');
                          print(element.category);
                        });
                      },
                      onTap: () {
                        final allProductInRestaurant =
                            productsConfigEachRestaurant
                                ?.allProductInRestaurant;

                        print('this is category ${category}, ');
                        allProductInRestaurant?.forEach((element) {
                          print(element.name);
                        });

                        print(
                            'number of row ${productsConfigEachRestaurant?.numberOfRow}');
                        if (productsConfigEachRestaurant?.numberOfRow != null) {
                          for (int i = 0;
                              i < productsConfigEachRestaurant!.numberOfRow;
                              i++) {
                            // final widgetAProductDetailConfigCategory =
                            //     widgetAProductDetailConfigCategory
                            //         .productInformationMap[i];

                            final productsConfigEachR =
                                productsConfigEachRestaurant;
                            final listproductInformation =
                                productsConfigEachRestaurant
                                    .productInformationMap[i]
                                    ?.productInformation;

                            final key = productsConfigEachR
                                .productInformationMap.keys
                                .toList();
                            print('key ${key.length}');
                            for (int indexOfEachRow = 0;
                                indexOfEachRow < key.length;
                                indexOfEachRow++) {
                              final productsOfEachRowConfig =
                                  productsConfigEachR.productInformationMap[i];
                              final productList =
                                  productsOfEachRowConfig?.productList;
                              final productListState =
                                  productsOfEachRowConfig?.productInformation;
                              print('products form widgetRestaurant');
                              productList?.forEach((elemt) {
                                print(elemt.name);
                              });
                              print('products intend to put on state');
                              productListState?.forEach((elemt) {
                                print(elemt.productName);
                              });
                              print(
                                  'row index ${indexOfEachRow}, StartPixcel ${productsOfEachRowConfig?.productStartPixcel},  EndPixcel ${productsOfEachRowConfig?.productEndPixcel}, category ${productsOfEachRowConfig?.category}');
                            }
                            print(
                                'this is product trong index ${productsConfigEachR.productInformationMap} number of produts ${listproductInformation?.length} ');
                            // print(
                            //     'this is product trong index ${i} number of produts ${listproductInformation?.length} ');
                            // if (listproductInformation != null) {
                            //   for (ProductInformation product
                            //       in listproductInformation) {
                            //     print('productName ${product.productName}');

                            //     print(
                            //         'indexInRow product ${product.indexInRow}');
                            //   }
                            //   print(
                            //       'startCount ${listproductInformation[0].startCount}');
                            //   print(
                            //       'endCount ${listproductInformation[0].endCount}');
                            //   print(
                            //       ' product length ${listproductInformation.length}');
                            // }
                          }
                        }
                      },
                      child: Text(category,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
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
