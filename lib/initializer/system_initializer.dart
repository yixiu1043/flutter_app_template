import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/initializer/app_initializer.dart';

class SystemInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
