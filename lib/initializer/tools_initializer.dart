import 'dart:async';

import 'package:yx_app/initializer/app_initializer.dart';
import 'package:yx_app/utils/tools.dart';

class ToolsInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    // await Tools.instance.getDeviceNo();
    await Tools.instance.getUserAgent();
  }
}
