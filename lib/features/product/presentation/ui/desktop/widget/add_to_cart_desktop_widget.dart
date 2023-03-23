import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/common/extensions/text_theme.dart';

import '../../../../../../common/styles/dimens.dart';

class AddToCartDesktopWidget extends ConsumerWidget {
  const AddToCartDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Quantity'.hardcoded,
          style: context.textTheme.titleMedium,
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.remove,
          ),
        ),
        Text(
          '1',
          style: context.textTheme.titleMedium,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
          ),
        ),
        const SizedBox(
          width: kXSmall,
        ),
        Container(
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
            style: context.textTheme.caption?.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
