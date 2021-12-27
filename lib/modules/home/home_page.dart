import 'package:flutter/material.dart';
import 'package:flutter_app_template/modules/home/home_controller.dart';
import 'package:flutter_app_template/public_widget/custom_theme.dart';
import 'package:flutter_app_template/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.FIND),
              child: Text('To Find Page'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.MINE),
              child: Text('To Mine Page'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.SEARCH),
              child: Text('To Search Page'),
            ),
          ],
        ),
      ),
    );
  }
}
