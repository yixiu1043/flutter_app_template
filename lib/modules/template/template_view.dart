import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/app_bar/custom_back_button.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});
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
