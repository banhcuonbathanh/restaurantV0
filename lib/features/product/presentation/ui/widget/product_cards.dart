import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/restaurant_title.dart';

import '../../../../../common/class/break_point.dart';

import '../../../../../common/styles/dimens.dart';
import '../../../../../common/widget/cache_image.dart';
import '../../../../../common/widget/product_price_widget.dart';
import '../../../domain/models/product.dart';
import '../../state/product_state.dart';

class ProductCards extends ConsumerWidget {
  const ProductCards({
    super.key,
    required this.state,
    required this.mediaQueryData,
    required this.scrollController,
  });

  final ProductState state;
  final MediaQueryData mediaQueryData;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productControllerProvider);
    final categories = productState.categories;
    // print('categories trong ProductCards');
    // print(categories.length);

    return ListView.builder(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        primary: false,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          // print('state.products.length');
          // print(state.products.length);
          // print('_scrollController.initialScrollOffset');
          // print(_scrollController.initialScrollOffset);

          // print('_scrollController.keepScrollOffset');
          // print(_scrollController.keepScrollOffset);

          // final product = state.products
          //     .where((element) => element.category == categories[index])
          //     .toList();

          // int numberOfAnimate = 0;
          // if (numberOfAnimate == 0) {
          //   _scrollController.animateTo(100,
          //       duration: const Duration(milliseconds: 1),
          //       curve: Curves.bounceIn);
          //   numberOfAnimate++;
          // }

          return Column(
            children: [
              RestuarantTitle(
                restaurantIndex: index,
                restaurantName: category,
                scrollController: scrollController,
              ),
              ProductGridCard(
                products: state.products,
                mediaQueryData: mediaQueryData,
                // scrollController: scrollController,

                category: category,
                // scrollController: _scrollController
              ),
            ],
          );
        });
  }
}

class ProductGridCard extends ConsumerStatefulWidget {
  final List<Product> products;
  final MediaQueryData mediaQueryData;
  final String category;
  // final ScrollController scrollController;
  const ProductGridCard(
      {required this.category,
      // required this.scrollController,
      required this.products,
      required this.mediaQueryData,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductGridCardState();
}

class _ProductGridCardState extends ConsumerState<ProductGridCard> {
  @override

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (mounted) {
  //       final box = context.findRenderObject() as RenderBox;
  //       widgetHeight = box.size.height;
  //       widgetWidth = box.size.width;

  //       ref
  //           .read(AbstractUtilityProvider.widgetConfig.notifier)
  //           .addWidgetConfiguration(
  //               restaurantIndex: 100,
  //               ten: 'ProductGridCard',
  //               positionPixcel: 0,
  //               widgetHeight: widgetHeight,
  //               widgetWidth: widgetWidth);

  //       // ref
  //       //     .read(AbstractUtilityProvider.widgetConfig.notifier)
  //       //     .addWidgetConfiguration(
  //       //         restaurantIndex: widget.restaurantIndex,
  //       //         ten: widget.restaurantName,
  //       //         positionPixcel: widget.scrollController.position.pixels,
  //       //         widgetHeight: widgetHeight,
  //       //         widgetWidth: widgetWidth);
  //     }
  //   });
  //   super.initState();
  // }
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     double widgetPosition = 0.0;
  //     double widgetHeight = 0;
  //     double widgetWidth = 0;
  //     if (mounted) {
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         final box = context.findRenderObject() as RenderBox;

  //         widgetPosition = box.globalToLocal(Offset.zero).dy +
  //             widget.scrollController.position.pixels;
  //         widgetHeight = box.size.height;
  //         widgetWidth = box.size.width;
  //         // print('this Future trong RestuarantTitle');
  //         // print('widget.restaurantName');
  //         // print(widget.restaurantName);
  //         // print('widget.scrollController.position.pixels');
  //         // print(widget.scrollController.position.pixels);
  //         // print('widgetHeight');
  //         // print(widgetHeight);
  //         // print('widgetWidth');
  //         // print(widgetWidth);
  //         print(widget.restaurantName);
  //         print('this is widgetPosition globalToLocal');
  //         print(widgetPosition);
  //         final widgetCover = widgetPosition < 0
  //             ? widgetPosition.abs()
  //             : ref
  //                 .read(AbstractUtilityProvider.widgetConfig.notifier)
  //                 .addWidgetConfiguration(
  //                     restaurantIndex: widget.restaurandIndex,
  //                     ten: widget.restaurandIndex.toString(),
  //                     positionPixcel: widget.scrollController.position.pixels,
  //                     widgetHeight: widgetHeight,
  //                     widgetWidth: widgetWidth);
  //       });
  //     }

  //     // final box = context.findRenderObject() as RenderBox;

  //     // final widgetsize = box.size;
  //     // // print(widget.restaurantName);
  //     // // print(widgetsize.height);
  //     // // print(widgetsize.width);
  //     // double positionPixcel = 0;
  //     // double? previousePixcel1 = 0;
  //     // for (int i = 1; i < widget.restaurandIndex + 1; i++) {
  //     //   if (i == 1) {
  //     //     previousePixcel1 = 10.0;
  //     //   } else {
  //     //     previousePixcel1 = ref
  //     //         .watch(
  //     //             AbstractUtilityProvider.widgetConfig)[widget.restaurantName]
  //     //         ?.widgetHeight;
  //     //   }

  //     //   positionPixcel = ((previousePixcel1 ?? 0) + widgetsize.height);
  //     // }
  //     // ref
  //     //     .read(AbstractUtilityProvider.widgetConfig.notifier)
  //     //     .addWidgetConfiguration(
  //     //         restaurantIndex: widget.restaurandIndex + 1,
  //     //         ten: widget.restaurantName,
  //     //         widgetHeight: widgetsize.height,
  //     //         widgetWidth: widgetsize.width,
  //     //         positionPixcel: positionPixcel);
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final productCategory =
        widget.products.where((element) => element.category == widget.category);
    return AlignedGridView.count(
      // controller: widget.scrollController,
      shrinkWrap: true,
      primary: false,
      itemCount: productCategory.length,

      crossAxisCount: widget.mediaQueryData.size.width >= BreakPoint.desktop
          ? 4
          : widget.mediaQueryData.size.width >= BreakPoint.tablet
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
          child: Builder(builder: (context) {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   if (mounted) {
            //     final box = context.findRenderObject() as RenderBox;
            //     widgetHeightCard = box.size.height;
            //     widgetWidthCard = box.size.width;

            //     ref
            //         .read(AbstractUtilityProvider.widgetConfig.notifier)
            //         .addWidgetConfiguration(
            //             restaurantIndex: 100,
            //             ten: 'ProductGridCard',
            //             positionPixcel: 0,
            //             widgetHeight: widgetHeight,
            //             widgetWidth: widgetWidth);

            //     // ref
            //     //     .read(AbstractUtilityProvider.widgetConfig.notifier)
            //     //     .addWidgetConfiguration(
            //     //         restaurantIndex: widget.restaurantIndex,
            //     //         ten: widget.restaurantName,
            //     //         positionPixcel: widget.scrollController.position.pixels,
            //     //         widgetHeight: widgetHeight,
            //     //         widgetWidth: widgetWidth);
            //   }
            // });
            return AProductCard(data: data);
          }),
        );
      },
    );
  }
}

class AProductCard extends ConsumerStatefulWidget {
  final Product data;
  const AProductCard({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AProductCardState();
}

class _AProductCardState extends ConsumerState<AProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                imageUrl: widget.data.images,
                height: 150,
              ),
            ),
            const SizedBox(
              height: kSmall,
            ),
            Text(
              widget.data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.black87,
                  ),
            ),
            ProductPriceWidget(
              discount: widget.data.formattedDiscount,
              discountedPrice: widget.data.formattedDiscountedPrice,
              price: widget.data.formattedPrice,
              showFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}

// class AProductCard extends StatelessWidget {
//   const AProductCard({
//     super.key,
//     required this.data,
//   });

//   final Product data;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: kSmall,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(kSmall),
//       ),
//       shadowColor: Colors.teal,
//       child: Padding(
//         padding: const EdgeInsets.all(kSmall),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: CacheImage(
//                 imageUrl: data.images,
//                 height: 150,
//               ),
//             ),
//             const SizedBox(
//               height: kSmall,
//             ),
//             Text(
//               data.name,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: Theme.of(context).textTheme.caption?.copyWith(
//                     color: Colors.black87,
//                   ),
//             ),
//             ProductPriceWidget(
//               discount: data.formattedDiscount,
//               discountedPrice: data.formattedDiscountedPrice,
//               price: data.formattedPrice,
//               showFavorite: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProductsGridCard extends StatefulWidget {
  const ProductsGridCard({
    super.key,
    required this.state,
    required this.mediaQueryData,
    required this.restaurantName,
    required this.restaurandIndex,
    required this.controller,
    // required this.scrollController,
  });

  final List<Product> state;
  final MediaQueryData mediaQueryData;
  final String restaurantName;
  final int restaurandIndex;
  final ScrollController controller;
  @override
  State<ProductsGridCard> createState() => _ProductsGridCardState();
}

class _ProductsGridCardState extends State<ProductsGridCard> {
  @override

  // final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      controller: widget.controller,
      shrinkWrap: true,
      primary: false,
      itemCount: widget.state.length,
      crossAxisCount: widget.mediaQueryData.size.width >= BreakPoint.desktop
          ? 4
          : widget.mediaQueryData.size.width >= BreakPoint.tablet
              ? 3
              : 2,
      crossAxisSpacing: kSmall,
      mainAxisSpacing: kSmall,
      // controller: _scrollController,
      itemBuilder: (context, index) {
        final data = widget.state[index];

        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/detail/${data.id}');
          },
          child: Builder(builder: (context) {
            return Card(
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
                    GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: CacheImage(
                          imageUrl: data.images,
                          height: 150,
                        ),
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
            );
          }),
        );
      },
    );
  }
}
