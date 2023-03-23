import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../common/styles/dimens.dart';
import '../../controller/product_detail_controller.dart';

class AddToCartWidget extends ConsumerWidget {
  final VoidCallback onTap;
  const AddToCartWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qty = ref.watch(
      productDetailControllerProvider.select((value) => value.quantity),
    );

    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(kSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: qty == 1
                      ? null
                      : () {
                          ref
                              .read(productDetailControllerProvider.notifier)
                              .decrementQty();
                        },
                  icon: Icon(
                    Icons.remove,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                Text(
                  qty.toString(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(productDetailControllerProvider.notifier)
                        .incrementQty();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                const SizedBox(
                  width: kXSmall,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kMedium,
                      vertical: kSmall,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(kMedium),
                    ),
                    child: Text(
                      'Add to Cart'.hardcoded,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
