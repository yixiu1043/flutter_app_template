// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_go_router_example/account_screen.dart';
// import 'package:flutter_go_router_example/navigation_transitions.dart';
// import 'package:flutter_go_router_example/products_list_screen.dart';
// import 'package:flutter_go_router_example/product_screen.dart';
// import 'package:flutter_go_router_example/scaffold_with_bottom_nav_bar.dart';
// import 'package:flutter_go_router_example/shpping_cart_screen.dart';
// import 'package:go_router/go_router.dart';
//
// enum AppRoute {
//   products,
//   product,
//   cart,
//   account,
// }
//
// final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
// final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
//
// final goRouter = GoRouter(
//   initialLocation: '/products',
//   navigatorKey: _rootNavigatorKey,
//   debugLogDiagnostics: true,
//   routes: [
//     ShellRoute(
//       navigatorKey: _shellNavigatorKey,
//       builder: (context, state, child) {
//         return ScaffoldWithBottomNavBar(child: child);
//       },
//       routes: [
//         // Products
//         GoRoute(
//           path: '/products',
//           name: AppRoute.products.name,
//           redirect: (context, state) {
//             print(state.toString());
//             return null;
//           },
//           pageBuilder: (context, state) => NoTransitionPage(
//             key: state.pageKey,
//             restorationId: state.pageKey.value,
//             child: const ProductsListScreen(),
//           ),
//           routes: [
//             GoRoute(
//               path: ':id',
//               name: AppRoute.product.name,
//               pageBuilder: (context, state) {
//                 int productId = int.parse(state.pathParameters['id']!);
//                 return SlideFromSideTransitionPage<dynamic>(
//                   state.pageKey,
//                   ProductScreen(productId: productId),
//                 );
//
//               },
//             ),
//           ],
//         ),
//         // Shopping Cart
//         GoRoute(
//           path: '/cart',
//           name: AppRoute.cart.name,
//           pageBuilder: (context, state) => NoTransitionPage(
//             key: state.pageKey,
//             child: const ShoppingCartScreen(),
//           ),
//         ),
//         // Account page
//         GoRoute(
//           path: '/account',
//           name: AppRoute.account.name,
//           pageBuilder: (context, state) => NoTransitionPage(
//             key: state.pageKey,
//             child: const AccountScreen(),
//           ),
//         ),
//       ],
//     ),
//   ],
// );
