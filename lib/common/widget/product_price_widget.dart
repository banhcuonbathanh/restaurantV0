import 'package:flutter/material.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../common/styles/dimens.dart';

class ProductPriceWidget extends StatelessWidget {
  final String discount;
  final String discountedPrice;
  final String price;
  final bool showFavorite;

  const ProductPriceWidget({
    Key? key,
    required this.discount,
    required this.discountedPrice,
    required this.price,
    required this.showFavorite,
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
            style: context.textTheme.caption?.copyWith(
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
              padding: const EdgeInsets.all(0),
              child: Text(
                '-$discount%',
                style: context.textTheme.caption?.copyWith(
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
        if (showFavorite) ...[
          Flexible(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                )),
          )
        ],
      ],
    );
  }
}
