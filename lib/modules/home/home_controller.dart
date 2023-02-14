import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yx_app/modules/home/mine/mine_page.dart';
import 'package:yx_app/modules/home/promotion/promotion_page.dart';
import 'package:yx_app/utils/run_catch.dart';

import 'main/main_page.dart';

class HomeController extends GetxController {

  late PageController pageController;
  final _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  final pages = const [
    MainPage(),
    PromotionPage(),
    MinePage(),
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    runCatch(() async { });
    super.onReady();
  }

  void onTap(int index) {
    if (currentIndex == index) {
      return;
    }
    jumpToPage(index);
  }

  // type 0 默认  1 弹出身份卡
  void jumpToPage(int index, {int type = 0}) {
    _currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
