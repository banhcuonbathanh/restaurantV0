import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import 'banner_image_carousel.dart';

class HomeBannerWidget extends ConsumerWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner =
        ref.watch(homeControllerProvider.select((value) => value.banners));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: banner,
          data: (data) {
            return BannerImageCarouselCopy(
              images: data,
            );
          }),
    );
  }
}
