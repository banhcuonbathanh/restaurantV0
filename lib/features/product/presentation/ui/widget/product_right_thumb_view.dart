import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/provider/utility_provider/utilityProvider.dart';

class ProductRightThumbView extends ConsumerStatefulWidget {
  const ProductRightThumbView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsDetailListViewState();
}

class _ProductsDetailListViewState
    extends ConsumerState<ProductRightThumbView> {
  int keyTest = 0;
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    final product = ref.watch(
        productControllerProvider.select((value) => value.productInformation));

    // final testData = ProductDetailsRowConfigMode();

    return Column(
      children: [
        for (int i = 0; i < product.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(product[i].productName),
            ),
          ),
        //   GestureDetector(
        //     onTap: () {
        //       setState(() {
        //         keyTest = i;
        //       });
        //     },
        //     child: Container(
        //       child: Text(key[i].productName),
        //     ),
        //   ),
      ],
    );
  }
}
