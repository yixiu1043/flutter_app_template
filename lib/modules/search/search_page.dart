import 'package:flutter/material.dart';
import 'package:flutter_app_template/modules/search/search_controller.dart';
import 'package:flutter_app_template/public_widget/custom_theme.dart';
import 'package:flutter_app_template/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final controller = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SEARCH'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.HOME),
              child: Text('To Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
