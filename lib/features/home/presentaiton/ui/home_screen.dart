import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/widget/app_scaffold_sliver.dart';
import 'package:restauranttdd0/features/home/presentaiton/controller/home_controller.dart';
import 'package:restauranttdd0/features/home/presentaiton/ui/widget/home_banner/home_banner.dart';
import 'package:restauranttdd0/features/home/presentaiton/ui/widget/home_feature_product/home_feature_product.dart';
import 'package:restauranttdd0/features/home/presentaiton/ui/widget/searching_bar/searching_button.dart';

import '../../../../common/app_const_data/size_config.dart';
import 'widget/home_brand/home_brand.dart';
import 'widget/home_category/home_category.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // ref.read(homeControllerProvider.notifier).int();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeControllerProvider.notifier).int();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppScaffoldSliver(
      title: Text('Home'.hardcoded),
      slivers: [
        HomeBannerWidget(),
        HomeCategoryWidget(),
        HomeBrandWidget(),
        SliverPersistentHeader(
          delegate: MySliverPersistentHeaderDelegate(
            child: Text('HomeFeatureProductWidget'),
          ),
          pinned: true,
        ),
        HomeFeatureProductWidget(),
      ],
      floatingButton: SearchingButton(),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MySliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 20.0,
      color: Colors.white,
      child: child,
    );
  }

  @override
  double get maxExtent => 20.0;

  @override
  double get minExtent => 20.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
