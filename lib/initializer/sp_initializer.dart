import 'dart:async';

import 'package:yx_app/initializer/app_initializer.dart';
import 'package:sp_util/sp_util.dart';

class SpInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    await SpUtil.getInstance();
  }
}
