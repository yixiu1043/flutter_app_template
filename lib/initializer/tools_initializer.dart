import 'dart:async';

import 'package:flutter_app_template/initializer/app_initializer.dart';
import 'package:flutter_app_template/utils/tools.dart';

class ToolsInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    await Tools.instance.getDeviceNo();
    await Tools.instance.getUserAgent();
  }
}
