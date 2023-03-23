import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateProvider<String?>(
  // We return the default sort type, here name.
  (ref) => null,
);
