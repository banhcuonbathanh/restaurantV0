import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';

import '../../../../domain/models/category_model/search_category_model.dart';
import '../../../controller/search_controller.dart';

class SearchCategoryWidget extends ConsumerStatefulWidget {
  const SearchCategoryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchCategoryWidgetState();
}

class _SearchCategoryWidgetState extends ConsumerState<SearchCategoryWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<SearchCategoryModel>> categorise =
        ref.watch(searchControllerProvider.select((value) => value.categories));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: categorise,
          data: (data) {
            return data.isNotEmpty
                ? CategoryGridWithData(
                    data: data,
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}

class CategoryGridWithData extends StatefulWidget {
  final List<SearchCategoryModel> data;
  const CategoryGridWithData({
    super.key,
    required this.data,
  });

  @override
  State<CategoryGridWithData> createState() => _CategoryGridWithDataState();
}

class _CategoryGridWithDataState extends State<CategoryGridWithData> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    int itemCount = 5;
    List<SearchCategoryModel> listCategoties8item = [];
    if (widget.data.isNotEmpty && widget.data.length > 4) {
      itemCount = expanded ? widget.data.length : 4;
      listCategoties8item = widget.data.sublist(0, itemCount);
    } else {
      listCategoties8item = widget.data;
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                final category = widget.data[index];

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
  }
}
