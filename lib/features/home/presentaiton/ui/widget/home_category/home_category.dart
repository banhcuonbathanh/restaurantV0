import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import '../../../../data/api/home_api_service.dart';

class HomeCategoryWidget extends ConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorise =
        ref.watch(homeControllerProvider.select((value) => value.categories));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: categorise,
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Catefory'.hardcoded,
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: kSmall,
                  ),
                  GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
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
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(kSmall)),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            );
          }),
    );
  }
}
