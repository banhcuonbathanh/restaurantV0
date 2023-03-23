import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/cache_manager_provider.dart';

class CacheImage extends ConsumerWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit boxFit;

  const CacheImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: boxFit,
      placeholder: (context, url) => const Icon(Icons.image),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      cacheManager: ref.read(cacheManagerProvider),
    );
  }
}
