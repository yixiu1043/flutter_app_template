import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/toast/toast_manager.dart';
import '../modules/home/home_page.dart';
import '../modules/mine/mine_page.dart';
import '../modules/promotion/promotion_page.dart';
import '../components/scaffold_with_bottom_nav_bar/scaffold_with_bottom_nav_bar.dart';
import '../modules/promotion_detail/promotion_detail_page.dart';
import 'navigation_transitions.dart';

part './app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppPages {
  static final pages = GoRouter(
    initialLocation: Routes.INITIAL,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    observers: [ToastObserver()],
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
          ),
          // Shopping Cart
          GoRoute(
            path: Routes.PROMOTION,
            name: Routes.PROMOTION,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PromotionPage(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) {
                  int promotionId = int.parse(state.pathParameters['id']!);
                  return SlideFromSideTransitionPage<dynamic>(
                    state.pageKey,
                    PromotionDetailPage(promotionId: promotionId),
                  );
                },
              ),
            ],
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
