import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yx_app/gen/assets.gen.dart';
import 'package:yx_app/utils/double_exit_will_pop_scaope.dart';
import 'package:yx_app/utils/overlay_extension.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  final bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabMain.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabMainSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'home_tab_main'.tr,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabPromotion.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabPromotionSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'home_tab_promotion'.tr,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        Assets.image.home.iconTabMine.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        Assets.image.home.iconTabMineSelected.path,
        width: 22,
        excludeFromSemantics: true,
        gaplessPlayback: true,
      ),
      label: 'home_tab_mine'.tr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DoubleExitWillPopScope(
      onIntercept: () {
        showToast('home_tab_exit'.tr);
      },
      onHandle: () {
        if (GetPlatform.isAndroid) {
          exit(0);
        }
      },
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          itemBuilder: (BuildContext context, int index) {
            return controller.pages[index];
          },
        ),
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.onTap,
            items: bottomNavigationBarItems,
          ),
        ),
      ),
    );
  }
}
