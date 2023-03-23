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

class HomeFeatureProductWidget extends ConsumerWidget {
  const HomeFeatureProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref
        .watch(homeControllerProvider.select((value) => value.feartureProduct));
    final ScrollController _scrollController = ScrollController();

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: product,
          data: (products) {
            final MediaQueryData mediaQueryData = MediaQuery.of(context);
            products.shuffle();
            return Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HomeFeatureProductWidget'.hardcoded,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: kSmall,
                  ),
                  AlignedGridView.count(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: products.length,
                    crossAxisCount:
                        mediaQueryData.size.width >= BreakPoint.desktop
                            ? 4
                            : mediaQueryData.size.width >= BreakPoint.tablet
                                ? 3
                                : 2,
                    crossAxisSpacing: kSmall,
                    mainAxisSpacing: kSmall,
                    // controller: _scrollController,
                    itemBuilder: (context, index) {
                      final data = products[index];

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
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        color: Colors.black87,
                                      ),
                                ),
                                ProductPriceWidget(
                                  discount: data.formattedDiscount,
                                  discountedPrice:
                                      data.formattedDiscountedPrice,
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
          }),
    );
  }
}
