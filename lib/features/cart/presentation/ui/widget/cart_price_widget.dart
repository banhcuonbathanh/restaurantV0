import 'package:flutter/material.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../common/styles/dimens.dart';

class CartPriceWidget extends StatelessWidget {
  final String discount;
  final String discountedPrice;
  final String price;

  const CartPriceWidget({
    Key? key,
    required this.discount,
    required this.discountedPrice,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (discount != "0") ...[
          Text(
            discountedPrice,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.redAccent[400],
            ),
          ),
          const SizedBox(
            width: kXSmall,
          ),
          Text(
            price,
            style: context.textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(
            width: kXSmall,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(
                kSmall,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kXSmall),
              child: Text(
                '-$discount%',
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.redAccent[400],
                ),
              ),
            ),
          )
        ] else ...[
          Text(
            price,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.redAccent[400],
            ),
          ),
        ],
      ],
    );
  }
}
