import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/product/presentation/ui/widget/product_detail_widget.dart';

import '../../../../common/class/break_point.dart';
import '../controller/product_detail_controller.dart';
import 'desktop/widget/product_detail_desktop_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const ProductDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productDetailControllerProvider.notifier).getProduct(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= BreakPoint.desktop) {
      return const ProductDetailDesktopWidget();
    } else {
      return const ProductDetailWidget();
    }
  }
}
