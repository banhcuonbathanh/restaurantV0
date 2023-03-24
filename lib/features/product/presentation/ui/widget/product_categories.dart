import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/provider/utility_provider/utilityProvider.dart';

import '../../../../../common/styles/dimens.dart';
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
  String isOnScreen = '';
  @override
  Widget build(BuildContext context) {
    final productcontroller = ref.watch(productControllerProvider);
    final ScrollController categoryScrollController = ScrollController();
    final categoriesData = widget.state.categories;
    final categoryOnScreen = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    final fetchingState = ref
        .watch(productControllerProvider.select((value) => value.isFetching));
    final widgetPara =
        ref.watch(AbstractUtilityProvider.widgetProductsCardConfigProvider);
//---------
    categoryScrollController.addListener(() {
      final maxScrollExtent = categoryScrollController.position.maxScrollExtent;

      if (categoryScrollController.position.pixels >= maxScrollExtent) {
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
    final widgetAProductDetailConfig =
        ref.watch(widgetAProductDetailConfigProvider);

    return Row(
      children: [
        Flexible(
          flex: 12,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              controller: categoryScrollController,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoriesData.length,
              itemBuilder: (context, index) {
                final category = categoriesData[index];
                final test = widgetPara[category];
                // final name = ref.watch(
                //     AbstractUtilityProvider.titleShowingOnProductCategoriesList);
//--------------------------

                final ProductDetailsRowConfigMode?
                    widgetAProductDetailConfigCategory =
                    widgetAProductDetailConfig[category];
                print('widgetAProductDetailConfigCategory');
                print(
                    widgetAProductDetailConfigCategory!.productInformationMap);
                final Map<int, ProductIndexConfig> productIndexConfig =
                    widgetAProductDetailConfigCategory.productInformationMap;
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

                          for (int i = 0;
                              i <
                                  widgetAProductDetailConfigCategory
                                      .numberOfRow;
                              i++) {
                            final productIndexConfigindex =
                                productIndexConfig[i];
                            if (productIndexConfigindex != null) {
                              if (widget.appScroller.position.pixels >
                                  productIndexConfigindex.productStartPixcel) {
                                if (widget.appScroller.position.pixels <
                                    productIndexConfigindex.productEndPixcel) {
                                  ref
                                      .read(productControllerProvider.notifier)
                                      .updateThumbProduct(
                                          thumProduct: productIndexConfigindex
                                              .productInformation);
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
                        }
                      }
                    }
                  });
                }
                //---------------------horizontal move
                if (categoryOnScreen?.categoryOnScreen == category) {
                  final double scrollOffset = index * 80;

                  Future(() {}).then((value) {
                    categoryScrollController.animateTo(scrollOffset,
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.linear);
                  });
                }

                //-----------------
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (categoryOnScreen?.categoryOnScreen == category)
                            ? Colors.orange
                            : Colors.blue),
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
                        print('this is category ');
                        print(
                            'number of row ${widgetAProductDetailConfigCategory.numberOfRow}');
                        for (int i = 0;
                            i < widgetAProductDetailConfigCategory.numberOfRow;
                            i++) {
                          print('this is product trong index ${i}');
                          final products = widgetAProductDetailConfigCategory
                              .productInformationMap[i]?.productInformation;
                          if (products != null) {
                            for (ProductInformation product in products) {
                              print('this is product deatil');
                              print(product.productName);
                            }
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
