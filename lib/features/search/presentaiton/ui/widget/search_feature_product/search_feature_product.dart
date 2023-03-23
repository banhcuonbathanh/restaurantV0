import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import '../../../../../../common/class/break_point.dart';
import '../../../../../../common/widget/product_price_widget.dart';
import '../../../../../home/domain/models/feartured_product_model/feartured_product_model.dart';
import '../../../../domain/models/feartured_product_model/search_feartured_product_model.dart';
import '../../../controller/search_controller.dart';

class SearchFeatureProductWidget extends ConsumerWidget {
  const SearchFeatureProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<SearchFeatureProductModel>> product = ref.watch(
        searchControllerProvider.select((value) => value.feartureProduct));
    final productSugest = ref
        .watch(homeControllerProvider.select((value) => value.feartureProduct));
    List<FeatureProductModel> test = [];
    productSugest.whenData((value) {
      test = value;
    });

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: product,
          data: (data) {
            return data.isNotEmpty
                ? FeatureProductWithData(
                    products: data,
                    title: 'Search Product',
                    productsSugest: [],
                  )
                : FeatureProductWithDataSugest1(
                    products: data,
                    title: 'Sugest Product',
                    productsSugest: test,
                  );
          }),
    );
  }
}

class FeatureProductWithData extends StatefulWidget {
  final String title;
  final List<SearchFeatureProductModel> products;
  final List<FeatureProductModel> productsSugest;
  const FeatureProductWithData({
    super.key,
    required this.products,
    required this.title,
    required this.productsSugest,
  });

  @override
  State<FeatureProductWithData> createState() => _FeatureProductWithDataState();
}

class _FeatureProductWithDataState extends State<FeatureProductWithData> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    int itemCount = 2;
    List<SearchFeatureProductModel> listCategoties8item = [];
    if (widget.products.isNotEmpty && widget.products.length > 2) {
      itemCount = expanded ? widget.products.length : 2;
      listCategoties8item = widget.products.sublist(0, itemCount);
    } else {
      listCategoties8item = widget.products;
    }
    listCategoties8item.shuffle();
    return Padding(
      padding: const EdgeInsets.all(kSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title.hardcoded,
                style: context.textTheme.titleSmall,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
          const SizedBox(
            height: kSmall,
          ),
          AlignedGridView.count(
            shrinkWrap: true,
            primary: false,
            itemCount: listCategoties8item.length,
            crossAxisCount: mediaQueryData.size.width >= BreakPoint.desktop
                ? 4
                : mediaQueryData.size.width >= BreakPoint.tablet
                    ? 3
                    : 2,
            crossAxisSpacing: kSmall,
            mainAxisSpacing: kSmall,
            // controller: _scrollController,
            itemBuilder: (context, index) {
              final data = widget.products[index];

              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/detail/${data.id}');
                },
                child: Card(
                  elevation: kSmall,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSmall),
                  ),
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(kSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CacheImage(
                            imageUrl: data.images,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          height: kSmall,
                        ),
                        Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                        ProductPriceWidget(
                          discount: data.formattedDiscount,
                          discountedPrice: data.formattedDiscountedPrice,
                          price: data.formattedPrice,
                          showFavorite: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeatureProductWithDataSugest1 extends StatefulWidget {
  final String title;
  final List<SearchFeatureProductModel> products;
  final List<FeatureProductModel> productsSugest;

  const FeatureProductWithDataSugest1(
      {super.key,
      required this.title,
      required this.products,
      required this.productsSugest});

  @override
  State<FeatureProductWithDataSugest1> createState() =>
      _FeatureProductWithDataSugest1State();
}

class _FeatureProductWithDataSugest1State
    extends State<FeatureProductWithDataSugest1> {
  bool expanded = true;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    int itemCount = 2;
    List<FeatureProductModel> listCategoties8item = [];
    if (widget.productsSugest.isNotEmpty && widget.productsSugest.length > 2) {
      itemCount = expanded ? widget.productsSugest.length : 2;
      listCategoties8item = widget.productsSugest.sublist(0, itemCount);
    } else {
      listCategoties8item = widget.productsSugest;
    }
    listCategoties8item.shuffle();

    // listCategoties8item.shuffle();
    return Padding(
      padding: const EdgeInsets.all(kSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title.hardcoded,
                style: context.textTheme.titleSmall,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
          const SizedBox(
            height: kSmall,
          ),
          AlignedGridView.count(
            shrinkWrap: true,
            primary: false,
            itemCount: listCategoties8item.length,
            crossAxisCount: mediaQueryData.size.width >= BreakPoint.desktop
                ? 4
                : mediaQueryData.size.width >= BreakPoint.tablet
                    ? 3
                    : 2,
            crossAxisSpacing: kSmall,
            mainAxisSpacing: kSmall,
            // controller: _scrollController,
            itemBuilder: (context, index) {
              final data = listCategoties8item[index];

              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/detail/${data.id}');
                },
                child: Card(
                  elevation: kSmall,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kSmall),
                  ),
                  shadowColor: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(kSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CacheImage(
                            imageUrl: data.images,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          height: kSmall,
                        ),
                        Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Colors.black87,
                              ),
                        ),
                        ProductPriceWidget(
                          discount: data.formattedDiscount,
                          discountedPrice: data.formattedDiscountedPrice,
                          price: data.formattedPrice,
                          showFavorite: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// class FeatureProductWithDataSugest extends StatefulWidget {
//   final String title;
//   final List<SearchFeatureProductModel> products;
//   final List<FeatureProductModel> productsSugest;
//   const FeatureProductWithDataSugest({
//     super.key,
//     required this.products,
//     required this.title,
//     required this.productsSugest,
//   });

//   @override
//   State<FeatureProductWithData> createState() =>
//       _FeatureProductWithDataStateSugest();
// }

// class _FeatureProductWithDataStateSugest extends State<FeatureProductWithData> {
//   bool expanded = false;
//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);
//     int itemCount = 2;
//     List<FeatureProductModel> listCategoties8item = [];
//     if (widget.productsSugest.isNotEmpty && widget.productsSugest.length > 2) {
//       itemCount = expanded ? widget.productsSugest.length : 2;
//       listCategoties8item = widget.productsSugest.sublist(0, itemCount);
//     } else {
//       listCategoties8item = widget.productsSugest;
//     }
//     // listCategoties8item.shuffle();
//     return Padding(
//       padding: const EdgeInsets.all(kSmall),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 widget.title.hardcoded,
//                 style: context.textTheme.titleSmall,
//               ),
//               const Spacer(),
//               IconButton(
//                   onPressed: () {
//                     setState(() {
//                       expanded = !expanded;
//                     });
//                   },
//                   icon: const Icon(Icons.more_vert)),
//             ],
//           ),
//           const SizedBox(
//             height: kSmall,
//           ),
//           AlignedGridView.count(
//             shrinkWrap: true,
//             primary: false,
//             itemCount: listCategoties8item.length,
//             crossAxisCount: mediaQueryData.size.width >= BreakPoint.desktop
//                 ? 4
//                 : mediaQueryData.size.width >= BreakPoint.tablet
//                     ? 3
//                     : 2,
//             crossAxisSpacing: kSmall,
//             mainAxisSpacing: kSmall,
//             // controller: _scrollController,
//             itemBuilder: (context, index) {
//               final data = widget.products[index];

//               return GestureDetector(
//                 onTap: () {
//                   GoRouter.of(context).push('/detail/${data.id}');
//                 },
//                 child: Card(
//                   elevation: kSmall,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(kSmall),
//                   ),
//                   shadowColor: Colors.teal,
//                   child: Padding(
//                     padding: const EdgeInsets.all(kSmall),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: CacheImage(
//                             imageUrl: data.images,
//                             height: 150,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: kSmall,
//                         ),
//                         Text(
//                           data.name,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: Theme.of(context).textTheme.caption?.copyWith(
//                                 color: Colors.black87,
//                               ),
//                         ),
//                         ProductPriceWidget(
//                           discount: data.formattedDiscount,
//                           discountedPrice: data.formattedDiscountedPrice,
//                           price: data.formattedPrice,
//                           showFavorite: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
