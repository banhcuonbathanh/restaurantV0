import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/features/cart/presentation/ui/widget/cart_widget.dart';

import '../../../../common/class/break_point.dart';
import '../../../../common/mixin/loading_overlay.dart';
import '../controller/cart_controller.dart';
import 'desktop/widget/cart_desktop_widget.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> with LoadingOverlay {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(cartControllerProvider.notifier).getUserCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= BreakPoint.desktop) {
      return const CartDesktopWidget();
    } else {
      return const CartWidget();
    }
  }
}
