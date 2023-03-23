import 'package:flutter/material.dart';

import 'package:restauranttdd0/features/product/presentation/ui/widget/product_carousel/product_detail_image_carousel.dart';

class ProductDetailImageCarousel extends StatelessWidget {
  final List<String> images;
  final bool isOutOfStock;

  const ProductDetailImageCarousel({
    Key? key,
    required this.images,
    required this.isOutOfStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageCarousel(
      images: images,
    );

    //     BCBRImageCarousel(
    //   images: images,
    //   boxColor: Colors.white,
    //   positionTextStyle: const TextStyle(color: Colors.black),
    //   boxFit: BoxFit.fill,
    //   autoPlay: true,
    //   dotColor: Colors.white,
    //   dotType: DotType.rounded,
    //   isOutOfStock: isOutOfStock,
    //   outOfStockText: "SOLD OUT".hardcoded,
    //   outOfStockTextStyle: const TextStyle(color: Colors.white),
    // );
  }
}
