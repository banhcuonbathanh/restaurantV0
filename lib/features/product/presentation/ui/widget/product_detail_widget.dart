import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_carousel/product_image_carousel.dart';

import 'package:restauranttdd0/features/product/presentation/ui/widget/product_specification_widget.dart';

import '../../../../../common/class/break_point.dart';
import '../../../../../common/mixin/loading_overlay.dart';
import '../../../../../common/styles/dimens.dart';
import '../../../../../common/widget/app_scaffold_scrollable.dart';
import '../../../../../common/widget/product_price_widget.dart';
import '../../../../../core/exception/failure.dart';
import '../../../../cart/presentation/controller/cart_controller.dart';
import '../../controller/product_detail_controller.dart';
import 'add_to_cart_widget.dart';

class ProductDetailWidget extends ConsumerStatefulWidget {
  const ProductDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProductDetailWidget> createState() =>
      _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends ConsumerState<ProductDetailWidget>
    with LoadingOverlay {
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    _listener();
    final productDetail =
        ref.watch(productDetailControllerProvider).productDetail;

    return AppScaffoldScrollable(
      title: const Text("Product Detail"),
      widget: productDetail.when(
        data: (product) {
          return Center(
            child: SizedBox(
              width: BreakPoint.tablet,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailImageCarousel(
                    images: product.productImages,
                    isOutOfStock: product.qty <= 0 ? true : false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kSmall),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductPriceWidget(
                          discount: product.formattedDiscount,
                          discountedPrice: product.formattedDiscountedPrice,
                          price: product.formattedPrice,
                          showFavorite: true,
                        ),

                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleSmall,
                        ),

                        Text(
                          product.shortDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodySmall,
                        ),

                        const SizedBox(
                          height: kSmall,
                        ),

                        // SKU -Brand - Category
                        Text(
                          'Specification'.hardcoded,
                          style: context.textTheme.titleSmall,
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ColoredBox(
                            color: Theme.of(context).focusColor,
                            child: Padding(
                              padding: const EdgeInsets.all(kSmall),
                              child: Wrap(
                                runSpacing: kXSmall,
                                children: [
                                  // SKU
                                  ProductSpecificationWidget(
                                    child: Text('sku: ${product.sku}'),
                                  ),

                                  const SizedBox(
                                    width: kSmall,
                                  ),

                                  // Brand
                                  ProductSpecificationWidget(
                                    child: Text('brand: ${product.brand}'),
                                  ),

                                  const SizedBox(
                                    width: kSmall,
                                  ),

                                  // Category
                                  ProductSpecificationWidget(
                                    child:
                                        Text('category: ${product.category}'),
                                  ),

                                  const SizedBox(
                                    width: kSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: kSmall,
                        ),

                        // Product long description
                        Text(
                          'Description'.hardcoded,
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          product.longDescription,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          final failure = error as Failure;
          return Center(
            child: Text(failure.message),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      bottomNavigationBar: AddToCartWidget(onTap: _addToCart),
    );
  }

  void _addToCart() {
    ref.read(productDetailControllerProvider.notifier).addToCart();
  }

  void _listener() {
    ref.listen(cartControllerProvider.select((value) => value.isLoading),
        (previous, next) {
      if (next) {
        _overlayEntry = showLoadingOverlay(context, _overlayEntry);
      } else {
        _overlayEntry?.remove();
      }
    });
  }
}
