import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/product_controller.dart';

class ProductErrorWidget extends ConsumerWidget {
  const ProductErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMsg =
        ref.watch(productControllerProvider.select((value) => value.errorMsg));

    if (errorMsg == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Text(
        errorMsg,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.redAccent,
            ),
      ),
    );
  }
}
