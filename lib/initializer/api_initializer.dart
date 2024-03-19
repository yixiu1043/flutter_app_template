import 'dart:async';

import 'package:flutter_app_template/initializer/app_initializer.dart';

import '../main.reflectable.dart';

class ApiInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    initializeReflectable();
  }
}
