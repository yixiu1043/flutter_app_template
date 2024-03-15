import 'package:flutter/material.dart';

import '../../components/app_bar/custom_back_button.dart';

class PromotionDetailPage extends StatelessWidget {
  final int promotionId;

  const PromotionDetailPage({super.key, required this.promotionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Promotion'),
      ),
      body: Center(child: Text(promotionId.toString())),
    );
  }
}
