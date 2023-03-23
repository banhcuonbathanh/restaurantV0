import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restauranttdd0/core/route/route_name.dart';

import '../../common/error/no_internet_connection_screen.dart';
import '../../common/error/no_route_screen.dart';

import '../../features/auth/login/presentation/ui/login_screen.dart';

import '../../features/auth/signup/presentation/ui/signup_screen.dart';
import '../../features/cart/presentation/ui/cart_screen.dart';
import '../../features/dashboard/presentation/ui/dashboard_screen.dart';

import '../../features/home/presentaiton/ui/home_screen.dart';
import '../../features/product/presentation/ui/product_detail_screen.dart';
import '../../features/product/presentation/ui/product_screen.dart';
import '../../features/search/presentaiton/ui/search_screen.dart';
import '../../features/setting/presentation/ui/setting_screen.dart';
import 'notifier/go_router_notifier.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    debugLogDiagnostics: false,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isGoingToLogin = state.subloc == '/login';
      final isGoingToNoInternet = state.location == '/noInternet';
      final isGoingToSignUp = state.location == '/login/signUp';

      if (!isDuplicate) {
        if (isLoggedIn) {
          if (isGoingToLogin || isGoingToSignUp) {
            isDuplicate = true;
            return '/';
          }
        } else {
          if (!isGoingToLogin && !isGoingToSignUp && !isGoingToNoInternet) {
            isDuplicate = true;
            return '/login?from=${state.subloc}';
          }
        }
      }

      if (isDuplicate) {
        isDuplicate = false;
      }

      return null;
    },
    routes: <RouteBase>[
      // GoRoute(
      //   path: 'search',
      //   name: searchRoute,
      //   pageBuilder: (context, state) {
      //     // final id = int.parse(state.params['id'].toString());
      //     return NoTransitionPage(
      //       key: state.pageKey,
      //       child: SearchScreen(
      //         // id: id,
      //         key: state.pageKey,
      //       ),
      //     );
      //   },
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/search',
        // name: noInternetRoute,
        builder: (context, state) => SearchScreen(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/noInternet',
        name: noInternetRoute,
        builder: (context, state) =>
            NoInternetConnectionScreen(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: loginRoute,
        builder: (context, state) {
          final from = state.queryParams['from'];

          return LoginScreen(key: state.pageKey, from: from);
        },
        routes: [
          GoRoute(
            path: 'signUp',
            name: signUpRoute,
            builder: (context, state) => SignUpScreen(key: state.pageKey),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardScreen(key: state.pageKey, child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: homeRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: HomeScreen(
                  key: state.pageKey,
                ),
              );
            },
            routes: [
              GoRoute(
                path: 'detail/:id',
                name: productDetailRoute,
                pageBuilder: (context, state) {
                  final id = int.parse(state.params['id'].toString());
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: ProductDetailScreen(
                      id: id,
                      key: state.pageKey,
                    ),
                  );
                },
              ),
              // GoRoute(
              //   path: 'search',
              //   name: searchRoute,
              //   pageBuilder: (context, state) {
              //     // final id = int.parse(state.params['id'].toString());
              //     return NoTransitionPage(
              //       key: state.pageKey,
              //       child: SearchScreen(
              //         // id: id,
              //         key: state.pageKey,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
          GoRoute(
            path: '/product',
            name: productRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: ProductScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/cart',
            name: cartRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: CartScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/setting',
            name: settingRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: SettingScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => NoRouteScreen(
      key: state.pageKey,
    ),
  );
});
