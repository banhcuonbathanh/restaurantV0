import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:carousel_slider/carousel_slider.dart';

class BannerImageCarouselCopy extends StatefulWidget {
  final List<String> images;
  const BannerImageCarouselCopy({Key? key, required this.images})
      : super(key: key);

  @override
  State<BannerImageCarouselCopy> createState() => _PromotionSliderState();
}

class _PromotionSliderState extends State<BannerImageCarouselCopy> {
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          // carouselController: buttonCarouselController,
          itemCount: widget.images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.images[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          options: CarouselOptions(
            height: 300,
            // aspectRatio: 16 / 9,
            // viewportFraction: 0.5,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.images.length,
          effect: const WormEffect(dotHeight: 10, dotWidth: 10),
        ),
      ],
    );
  }
}
