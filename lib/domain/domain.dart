import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:sp_util/sp_util.dart';

import '../flavor/properties.dart';
import '../net/domain/domain_switch_handler.dart';

final Set<Dio> domains = {
  Dio(BaseOptions(
    baseUrl: SpUtil.getString(LAUNCH_KEY, defValue: null) ??
        Flavor.I.getString(LAUNCH_URL)!,
    connectTimeout: const Duration(milliseconds: 8000),
    sendTimeout: const Duration(milliseconds: 8000),
    receiveTimeout: const Duration(milliseconds: 8000),
  )),
  Dio(BaseOptions(
    baseUrl: SpUtil.getString(MEMBER_KEY, defValue: null) ??
        Flavor.I.getString(MEMBER_URL)!,
    connectTimeout: const Duration(milliseconds: 8000),
    sendTimeout: const Duration(milliseconds: 8000),
    receiveTimeout: const Duration(milliseconds: 8000),
  )),
  Dio(BaseOptions(
    baseUrl: SpUtil.getString(CGW_KEY, defValue: null) ??
        Flavor.I.getString(CGW_URL)!,
    connectTimeout: const Duration(milliseconds: 8000),
    sendTimeout: const Duration(milliseconds: 8000),
    receiveTimeout: const Duration(milliseconds: 8000),
  )),
};
