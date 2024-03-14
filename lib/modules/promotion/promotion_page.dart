import 'package:flutter/material.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Promotion')),
    );
  }
}
