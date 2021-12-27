import 'package:flutter_app_template/modules/find/find_controller.dart';
import 'package:flutter_app_template/modules/find/find_page.dart';
import 'package:flutter_app_template/modules/home/home_page.dart';
import 'package:flutter_app_template/modules/home/home_controller.dart';
import 'package:flutter_app_template/modules/mine/mine_controller.dart';
import 'package:flutter_app_template/modules/mine/mine_page.dart';
import 'package:flutter_app_template/modules/search/search_controller.dart';
import 'package:flutter_app_template/modules/search/search_page.dart';
import 'package:flutter_app_template/modules/wallet/wallet_controller.dart';
import 'package:flutter_app_template/modules/wallet/wallet_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => HomeController()),
        },
      ),
      children: [
        GetPage(
          name: AppRoutes.SEARCH,
          page: () => SearchPage(),
          binding: BindingsBuilder(
            () => {
              Get.lazyPut(() => SearchController()),
            },
          ),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.FIND,
      page: () => FindPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => FindController()),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.MINE,
      page: () => MinePage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => MineController()),
        },
      ),
      children: [
        GetPage(
          name: AppRoutes.WALLET,
          page: () => WalletPage(),
          binding: BindingsBuilder(
            () => {
              Get.lazyPut(() => WalletController()),
            },
          ),
        ),
      ],
    ),
  ];
}
