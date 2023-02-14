import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:yx_app/flavor/properties.dart';
import 'package:yx_app/initializer/app_initializer.dart';
import 'package:yx_app/net/api/activity_api.dart';
import 'package:yx_app/net/domain/domain_switch_handler.dart';
import 'package:sp_util/sp_util.dart';
// import 'package:yx_app/main.reflectable.dart' ;

class ApiInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    final launchDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(LAUNCH_KEY, defValue: null) ??
          Flavor.I.getString(LAUNCH_URL)!,
      connectTimeout: 8000,
      sendTimeout: 8000,
      receiveTimeout: 8000,
    ));
    final memberDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(MEMBER_KEY, defValue: null) ??
          Flavor.I.getString(MEMBER_URL)!,
      connectTimeout: 8000,
      sendTimeout: 8000,
      receiveTimeout: 8000,
    ));
    final cgwDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(CGW_KEY, defValue: null) ??
          Flavor.I.getString(CGW_URL)!,
      connectTimeout: 8000,
      sendTimeout: 8000,
      receiveTimeout: 8000,
    ));

    Get
      ..put(launchDio, tag: LAUNCH_URL)
      ..put(memberDio, tag: MEMBER_URL)
      ..put(cgwDio, tag: CGW_URL)
      ..put(ActivityApi(cgwDio));
    // initializeReflectable();
  }
}
