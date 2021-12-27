import 'package:flutter/material.dart';
import 'package:flutter_app_template/modules/find/find_controller.dart';
import 'package:flutter_app_template/public_widget/custom_theme.dart';
import 'package:flutter_app_template/routes/app_pages.dart';
import 'package:get/get.dart';

class FindPage extends StatelessWidget {
  FindPage({Key? key}) : super(key: key);
  final controller = Get.find<FindController>();

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FIND'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.MINE),
              child: Text('To Mine Page'),
            ),
          ],
        ),
      ),
    );
  }
}
