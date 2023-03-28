import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import '../../../../domain/models/category_model/category_model.dart';

class HomeCategoryWidget extends ConsumerStatefulWidget {
  const HomeCategoryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends ConsumerState<HomeCategoryWidget> {
  bool expanded = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    final categorise =
        ref.watch(homeControllerProvider.select((value) => value.categories));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: categorise,
          data: (data) {
            int itemCount = 5;
            List<CategoryModel> listCategoties8item = [];
            if (data.isNotEmpty && data.length > 5) {
              itemCount = expanded ? data.length : 5;
              listCategoties8item = data.sublist(0, itemCount);
            } else {
              listCategoties8item = data;
            }
            return Padding(
              padding: const EdgeInsets.all(kSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Catefory'.hardcoded,
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
                  GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: listCategoties8item.length,
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
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(kSmall)),
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
                ],
              ),
            );
          }),
    );
  }
}
