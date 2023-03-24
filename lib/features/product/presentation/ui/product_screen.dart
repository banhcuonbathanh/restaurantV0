import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/features/product/presentation/state/product_state.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_cards.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_categories.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_error_widget.dart';

import '../../../../common/styles/dimens.dart';
import '../../../../common/widget/app_scaffold.dart';

import '../controller/product_controller.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  int number = 0;
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(productControllerProvider.notifier)
          .getProductstest(pageNumber: 0);
    });

    scrollController.addListener(() {
      final maxScrollExtent = scrollController.position.maxScrollExtent - 200;

      if (scrollController.position.pixels >= maxScrollExtent - 200) {
        final currentPage = ref.read(productControllerProvider).currentPage;
        final totalPage = ref.read(productControllerProvider).totalPage;

        if (currentPage < totalPage) {
          ref
              .read(productControllerProvider.notifier)
              .getProductstest(pageNumber: currentPage + 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build ProductScreen ${number}');

    number++;

    // if (number == 0) {
    //   setState(() {
    //     number = 1;
    //   });
    // }
    // setState(() {

    // });
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final state = ref.watch(productControllerProvider);

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (state.products.isEmpty) {
      return Center(
        child: Text("Empty product list".hardcoded),
      );
    }

    return AppScaffold(
      title: const Text('Product'),
      widget: Stack(
        children: [
          const ProductErrorWidget(),
          ProductBody(
              state: state,
              mediaQueryData: mediaQueryData,
              scrollController: scrollController),
          if (state.isFetching) ...[
            const Positioned(
              bottom: kSmall,
              left: 0,
              right: 0,
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          ],
          Positioned(
            bottom: 0,
            right: 0,
            child: Column(
              children: [
                Text('data'),
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  const ProductBody(
      {super.key,
      required this.state,
      required this.mediaQueryData,
      required this.scrollController});

  final ProductState state;
  final MediaQueryData mediaQueryData;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ProductCategories(
          state: state,
          appScroller: scrollController,
        )),
        Flexible(
          flex: 18,
          child: ProductCards(
              state: state,
              mediaQueryData: mediaQueryData,
              scrollController: scrollController),
        ),
      ],
    );
  }
}
