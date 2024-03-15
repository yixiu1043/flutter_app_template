import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/app_bar/custom_back_button.dart';
import '../../router/app_pages.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Promotion'),
            ElevatedButton(
              onPressed: () {
                const int id = 1;
                context.go('${Routes.PROMOTION}/$id');
              },
              child: const Text('GO Promotion Detail'),
            )
          ],
        ),
      ),
    );
  }
}
