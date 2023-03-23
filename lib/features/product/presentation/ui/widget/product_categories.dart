import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/provider/utility_provider/utilityProvider.dart';
import '../../../../../common/styles/dimens.dart';
import '../../../application/product_service.dart';
import '../../../domain/models/product.dart';
import '../../controller/product_controller.dart';
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
    final categoriesData = widget.state.categories;

    final appConfig = ref.watch(AbstractUtilityProvider.appConfig);
    final productService = ref.watch(productServiceProvider);
    final widgetPara = ref.watch(AbstractUtilityProvider.widgetParaProvider);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoriesData.length,
        itemBuilder: (context, index) {
          final name = ref.watch(
              AbstractUtilityProvider.titleShowingOnProductCategoriesList);

          final category = categoriesData[index];
          final test = widgetPara[category];
          // print(test?.name);
          // print(test?.index);
          if (test != null) {
            widget.appScroller.addListener(() {
              // print(widget.appScroller.position.pixels);
              // // print(test.startPixcel);
              // // print(test.hlafPixcel);

              // // ScrollDirection.reverse
              // print(widget.appScroller.position.userScrollDirection ==
              //     ScrollDirection.reverse);

              if (widget.appScroller.position.userScrollDirection ==
                  ScrollDirection.reverse) {
                if (widget.appScroller.position.pixels >
                    test.previousHalfPixcel) {
                  if (widget.appScroller.position.pixels < test.hlafPixcel) {
                    ref
                        .read(AbstractUtilityProvider
                            .titleShowingOnProductCategoriesList.notifier)
                        .titleOnScreen(title: test.name);
                  }
                }
              }

              if (widget.appScroller.position.userScrollDirection ==
                  ScrollDirection.forward) {
                if (widget.appScroller.position.pixels < test.hlafPixcel) {
                  if (widget.appScroller.position.pixels >
                      test.previousHalfPixcel) {
                    ref
                        .read(AbstractUtilityProvider
                            .titleShowingOnProductCategoriesList.notifier)
                        .titleOnScreen(title: test.name);
                  }
                }
              }
            });
          }

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (name == category) ? Colors.orange : Colors.blue,
              ),
              child: GestureDetector(
                onDoubleTap: () {
                  final test2 = ref.watch(productControllerProvider);
                  print('this is test 2');
                  print(test2);
                  print(test2.products.length);
                  print(test2.categories.length);
                  print(test2.brands.length);
                  print(test2.currentPage);
                  final categoty = test2.categories;
                  final List<Product> products = test2.products;
                  for (String category in categoty) {
                    print(category);
                  }
                  final Set<String> uniqueIds = Set();
                  final List<Product> duplicateProducts = [];

                  for (Product product in products) {
                    if (uniqueIds.contains(product.id)) {
                      duplicateProducts.add(product);
                    } else {
                      uniqueIds.add(product.id);
                    }
                  }
                  print(uniqueIds);
                  print(duplicateProducts);
                },
                onTap: () async {
                  // final query = {'perPage': 20, 'pageNumber': index};
                  // final test = await productService.getProducts(query);
                  print(index);
                  // print(test.whenSuccess((success) {
                  //   print(success);
                  //   return '';
                  // }));

                  final test = await ref
                      .read(productControllerProvider.notifier)
                      .getProductstest(pageNumber: index);
                  print(test.products.length);
                  print(test.categories.length);
                  print(test.brands.length);
                  print(test.currentPage);
                  final categoty = test.categories;
                  for (String category in categoty) {
                    print(category);
                  }
                },
                child: Text(
                  category,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          );
        });
  }
}
