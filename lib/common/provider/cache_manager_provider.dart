

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final cacheManagerProvider = Provider<CacheManager>((ref) {
  return CacheManager(
    Config(
      'eComCache',
      stalePeriod: const Duration(days: 14),
      maxNrOfCacheObjects: 500,
    ),
  );
});