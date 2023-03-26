import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restauranttdd0/common/provider/utility_provider/utilityProvider.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';

class ProductRightThumbView extends ConsumerStatefulWidget {
  const ProductRightThumbView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsDetailListViewState();
}

class _ProductsDetailListViewState
    extends ConsumerState<ProductRightThumbView> {
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(
        productControllerProvider.select((value) => value.productInformation));

    // final testData = ProductDetailsRowConfigMode();

    return Column(
      children: [
        for (int i = 0; i < product.length; i++)
          GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push('/detail/${product[i].productDetailId}');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GlassmorphicContainerSecondaryStyle(
                height: WidgetProductsCardConfigData.rightThumbPadViewHeight,
                width: WidgetProductsCardConfigData.rightThumbViewWidth,
                isPrimary: false,
                isGrey: false,
                child: Text(
                  product[i].productName,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade500),
                ),
              ),
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
