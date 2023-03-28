import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/app_const_data/size_config.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/logging/logging_provider.dart';
import 'common/provider/utility_provider/utilityProvider.dart';
import 'core/local/db/hive_db.dart';
import 'core/providers/internet_connection_observer.dart';
import 'core/route/go_router_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_const.dart';
import 'features/auth/login/presentation/controller/login_controller.dart';
import 'package:upgrader/upgrader.dart';

class MainWidget extends ConsumerStatefulWidget {
  const MainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends ConsumerState<MainWidget> with AppThemeMixin {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();
  final container = ProviderContainer();

  @override
  void initState() {
    container.read(internetConnectionObserverProvider);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(loginControllerProvider.notifier).getAccessToken();
    });
    // _openHive();
    _isNetworkConnected();
    _networkConnectionObserver();
  }

  void _isNetworkConnected() async {
    final isConnected =
        await ref.read(internetConnectionObserverProvider).isNetworkConnected();
    if (!isConnected) {
      if (!mounted) return;
      ref.read(goRouterProvider).push('/noInternet');
    }
  }

  void _networkConnectionObserver() {
    final connectionStream =
        ref.read(internetConnectionObserverProvider).hasConnectionStream.stream;
    connectionStream.listen((isConnected) {
      if (!isConnected) {
        ref.read(goRouterProvider).push('/noInternet');
      }
    });
  }

  void _showSnackBar() {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text(
          "No internet connection",
        ),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      scaffoldMessengerKey: scaffoldMessengerKey,
      localizationsDelegates: const [
        // AppLocalizations.delegate, // Add this line
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: AppLocales.supportedLocales,
      // locale: AppLocales.en.locale,
      theme: FlexThemeData.light(
        colors: customFlexScheme.light,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: flexSubThemesDataLight,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ),
      darkTheme: FlexThemeData.dark(
        colors: customFlexScheme.dark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: flexSubThemesDataDark,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ),
      themeMode: currentTheme(kLight),

      //home: isAppInBackground ? const ColoredBox(color: Colors.black) : const SettingScreen(),
    );
  }
}


    // An object that stores the state of the providers and allows overriding the behavior of a specific provider.

    // // Setup Logger
    // container.read(setupLoggingProvider);
    // // setup the hive database

    // await db.init();
    // // Observer internet connection