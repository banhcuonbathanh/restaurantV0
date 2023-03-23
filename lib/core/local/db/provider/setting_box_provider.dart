import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive_box_key.dart';

final settingBoxProvider = Provider<Box>((ref) {
  return Hive.box(settingBox);
});
