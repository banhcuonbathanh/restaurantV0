import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';
import 'package:restauranttdd0/common/styles/dimens.dart';
import 'package:restauranttdd0/common/widget/async_value_widget.dart';
import 'package:restauranttdd0/common/widget/cache_image.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';

import '../../../../domain/models/brand_model/search_brand_model.dart';
import '../../../controller/search_controller.dart';

class SearchBrandWidget extends ConsumerWidget {
  const SearchBrandWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<SearchBrandModel>> brands =
        ref.watch(searchControllerProvider.select((value) => value.brands));

    return SliverToBoxAdapter(
      child: AsyncValueWidget(
          value: brands,
          data: (data) {
            return data.isNotEmpty
                ? BrandGridWithData(
                    data: data,
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}

class BrandGridWithData extends StatefulWidget {
  final List<SearchBrandModel> data;
  const BrandGridWithData({
    super.key,
    required this.data,
  });

  @override
  State<BrandGridWithData> createState() => _BrandGridWithDataState();
}

class _BrandGridWithDataState extends State<BrandGridWithData> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    int itemCount = 5;
    List<SearchBrandModel> listCategoties8item = [];
    if (widget.data.isNotEmpty && widget.data.length > 5) {
      itemCount = expanded ? widget.data.length : 5;
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
                'Brand'.hardcoded,
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              shrinkWrap: true,
              primary: false,
              itemCount: listCategoties8item.length,
              itemBuilder: (context, index) {
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
