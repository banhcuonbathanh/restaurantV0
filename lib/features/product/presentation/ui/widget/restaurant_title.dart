import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/product_controller.dart';

class RestuarantTitle extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  final String restaurantName;

  final int restaurantIndex;
  RestuarantTitle(
      {required this.restaurantIndex,
      required this.scrollController,
      required this.restaurantName,
      super.key});

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

    return Container(
      height: 20,
      width: 200,
      color: Colors.orange,
      alignment: Alignment.center,
      child: Text(widget.restaurantName, style: const TextStyle()),
    );
  }
}
