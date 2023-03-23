import 'package:flutter/material.dart';

import '../../../../../common/styles/dimens.dart';

class ProductSpecificationWidget extends StatelessWidget {
  final Widget child;
  const ProductSpecificationWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kSmall,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(kSmall),
      ),
      child: child,
    );
  }
}
