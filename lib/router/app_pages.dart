import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/home/home_page.dart';
import '../modules/mine/mine_page.dart';
import '../modules/promotion/promotion_page.dart';
import 'scaffold_with_bottom_nav_bar.dart';

part './app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppPages {
  static final pages = GoRouter(
    initialLocation: Routes.INITIAL,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.HOME,
            name: Routes.HOME,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              restorationId: state.pageKey.value,
              child: const HomePage(),
            ),
            // routes: [
            //   GoRoute(
            //     path: ':id',
            //     name: AppRoute.product.name,
            //     pageBuilder: (context, state) {
            //       int productId = int.parse(state.pathParameters['id']!);
            //       return SlideFromSideTransitionPage<dynamic>(
            //         state.pageKey,
            //         ProductScreen(productId: productId),
            //       );
            //     },
            //   ),
            // ],
          ),
          // Shopping Cart
          GoRoute(
            path: Routes.PROMOTION,
            name: Routes.PROMOTION,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PromotionPage(),
            ),
          ),
          // Account page
          GoRoute(
            path: Routes.MINE,
            name: Routes.MINE,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const MinePage(),
            ),
          ),
        ],
      ),
    ],
  );
}
