import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yx_app/initializer/app_initializer.dart';

class SystemInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
