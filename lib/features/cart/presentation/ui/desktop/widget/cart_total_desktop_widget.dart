import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../../common/styles/dimens.dart';
import '../../../controller/cart_controller.dart';

class CartTotalDesktopWidget extends ConsumerWidget {
  const CartTotalDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartTotal = ref.watch(
      cartControllerProvider.select((value) => value.cartTotal),
    );

    if (cartTotal.contains('\$0.00') || cartTotal == '0.00' || cartTotal == '')
      return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(kSmall),
      child: ColoredBox(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(kSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total: $cartTotal',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: kSmall,
              ),
              GestureDetector(
                onTap: () {},
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
                    'Check Out'.hardcoded,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
