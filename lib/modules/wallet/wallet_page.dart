import 'package:flutter/material.dart';
import 'package:flutter_app_template/modules/wallet/wallet_controller.dart';
import 'package:flutter_app_template/public_widget/custom_theme.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);

  final controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wallet'),
        ),
        body: Column(
          children: [
            Text('Wallet'),
          ],
        ),
      ),
    );
  }
}
