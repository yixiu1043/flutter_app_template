import 'package:flutter/material.dart';

import '../../utils/overlay_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            ElevatedButton(
              onPressed: () {
                showToast('showToast');
              },
              child: const Text('showToast'),
            ),
            ElevatedButton(
              onPressed: () {
                showSuccess('Success');
              },
              child: const Text('showSuccess'),
            ),
            ElevatedButton(
              onPressed: () {
                showError('Error');
              },
              child: const Text('showError'),
            ),
          ],
        ),
      ),
    );
  }
}
