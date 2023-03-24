import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/local/db/hive_db.dart';
import 'core/providers/internet_connection_observer.dart';
import 'main_widget.dart';

void main() async {
  // An object that stores the state of the providers and allows overriding the behavior of a specific provider.
  final container = ProviderContainer();

  // // Setup Logger
  // container.read(setupLoggingProvider);
  // // // setup the hive database
  // -----------------------
  final db = container.read(hiveDbProvider);

  await db.init();
  // -----------------------
  // // Observer internet connection
  container.read(internetConnectionObserverProvider);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainWidget(),
    ),
    // UncontrolledProviderScope(
    //   container: container,
    //   child: const MyApp(),
    // ),
  );
}
