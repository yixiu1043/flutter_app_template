import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_template/components/app_bar/custom_back_button.dart';
import 'package:flutter_app_template/modules/template/template_controller.dart';

class TemplatePage extends StatelessWidget {
  TemplatePage({Key? key}) : super(key: key);
  final controller = Get.find<TemplateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('模版'),
      ),
      body: Container(),
    );
  }
}
