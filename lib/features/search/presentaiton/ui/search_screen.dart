import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/widget/app_scaffold_sliver.dart';
import 'package:restauranttdd0/features/search/presentaiton/ui/widget/search_bar/search_bar.dart';
import 'package:restauranttdd0/features/search/presentaiton/ui/widget/search_brand/search_brand.dart';
import 'package:restauranttdd0/features/search/presentaiton/ui/widget/search_category/search_category.dart';

import 'package:restauranttdd0/features/search/presentaiton/ui/widget/search_feature_product/search_feature_product.dart';

import '../../../../common/provider/search_provider/search_provider.dart';
import '../controller/search_controller.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    // ref.read(homeControllerProvider.notifier).int();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(searchProvider.notifier).state = '';
      ref.read(searchControllerProvider.notifier).int();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final test = ref.watch(searchProvider);
    return AppScaffoldSliver(
      title: Text('Search'.hardcoded),
      slivers: const [
        SearchCategoryWidget(),
        SearchBrandWidget(),
        SearchFeatureProductWidget(),
      ],
      bottomButton: const Padding(
        padding: EdgeInsets.only(bottom: 25, left: 10, right: 10),
        child: SearchButton(),
      ),
    );
  }
}
