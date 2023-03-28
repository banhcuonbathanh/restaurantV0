import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import '../../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../../common/app_const_data/size_config.dart';

class HomeBrandWidget extends ConsumerWidget {
  const HomeBrandWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController brandScrollController = ScrollController();
    final brands =
        ref.watch(homeControllerProvider.select((value) => value.brands));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: brands,
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brand'.hardcoded,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: kSmall,
                  ),
                  SizedBox(
                    height: WidgetProductsCardConfigData.homeBrandConfigHeight,
                    width: double.infinity,
                    child: ListView.builder(
                        controller: brandScrollController,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final category = data[index];
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Card(
                                child: CacheImage(
                                  imageUrl: category.thumbnail,
                                ),
                              ),
                              Container(
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius:
                                        BorderRadius.circular(kSmall)),
                                child: Text(
                                  category.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: kSmall,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: WidgetProductsCardConfigData
                              .homeBrandScrollingConfigCoverHeight,
                          // width: getProportionateScreenWidth(100),
                          width: WidgetProductsCardConfigData
                              .homeBrandScrollingConfigCoverWidth,
                        ),
                        Container(
                          height: WidgetProductsCardConfigData
                              .homeBrandScrollingConfigDotHeight,
                          width: WidgetProductsCardConfigData
                              .homeBrandScrollingConfigDotWidth,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                        )
                            .animate(
                                adapter: ScrollAdapter(brandScrollController))
                            .moveX(
                                end: WidgetProductsCardConfigData
                                    .homeBrandScrollingConfigDotMove),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
