import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';

class RestaurantLeftThumbView extends ConsumerStatefulWidget {
  const RestaurantLeftThumbView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsDetailListViewState();
}

class _ProductsDetailListViewState
    extends ConsumerState<RestaurantLeftThumbView> {
  int keyTest = 0;
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));

    // final testData = ProductDetailsRowConfigMode();

    return Column(
      children: [
        if (category != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: GlassmorphicContainerSecondaryStyle(
              height: WidgetProductsCardConfigData.rightThumbPadViewHeight,
              width: WidgetProductsCardConfigData.rightThumbViewWidth,
              isPrimary: true,
              isGrey: false,
              child: Text(
                category.categoryOnScreen,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis, color: Colors.black),
              ),
            ),
          ),
      ],
    );
  }
}
