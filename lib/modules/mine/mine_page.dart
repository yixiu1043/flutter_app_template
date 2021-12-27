import 'package:flutter/material.dart';
import 'package:flutter_app_template/modules/mine/mine_controller.dart';
import 'package:flutter_app_template/public_widget/custom_theme.dart';
import 'package:flutter_app_template/routes/app_pages.dart';
import 'package:get/get.dart';

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);

  final controller = Get.find<MineController>();

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MINE'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('${AppRoutes.MINE}${AppRoutes.WALLET}'),
              child: Text('To Wallet Page'),
            ),
          ],
        ),
      ),
    );
  }
}
