import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/controller/product_controller.dart';

import '../../../../../common/app_const_data/app_const_data.dart';
import '../../../../../common/widget/glassmorphic_container/glassmorphic.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RestuarantTitle extends ConsumerStatefulWidget {
  final String restaurantName;

  final int restaurantIndex;
  const RestuarantTitle(
      {required this.restaurantIndex, required this.restaurantName, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestuarantTitleState();
}

class _RestuarantTitleState extends ConsumerState<RestuarantTitle> {
  double widgetHeight = 0;
  double widgetWidth = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final box = context.findRenderObject() as RenderBox;
        widgetHeight = box.size.height;
        widgetWidth = box.size.width;

        // ref
        //     .read(AbstractUtilityProvider.widgetConfig.notifier)
        //     .addWidgetConfiguration(
        //         restaurantIndex: widget.restaurantIndex,
        //         ten: widget.restaurantName,
        //         positionPixcel: widget.scrollController.position.pixels,
        //         widgetHeight: widgetHeight,
        //         widgetWidth: widgetWidth);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryOnScreen = ref.watch(
        productControllerProvider.select((value) => value.categoryOnScreen));
    return GlassmorphicContainerSecondaryStyle(
      height: WidgetProductsCardConfigData.heightOfRestaurantTitle,
      width: WidgetProductsCardConfigData.widthOfRestaurantTitle,
      isPrimary: categoryOnScreen?.categoryOnScreen == widget.restaurantName
          ? true
          : false,
      isGrey: false,
      child: Text(
        widget.restaurantName,
        style: const TextStyle(),
      ),
    )
        .animate(
            target: categoryOnScreen?.categoryOnScreen == widget.restaurantName
                ? 1
                : 0)
        .slideX(end: 0, begin: -1)
        .fadeIn(begin: 0.5);
  }
}
