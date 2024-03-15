import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter_app_template/flavor/properties.dart';
import 'package:flutter_app_template/initializer/app_initializer.dart';
import 'package:flutter_app_template/net/domain/domain_switch_handler.dart';
import 'package:sp_util/sp_util.dart';

class ProxyInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    final launchDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(LAUNCH_KEY, defValue: null) ??
          Flavor.I.getString(LAUNCH_URL)!,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));
    final memberDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(MEMBER_KEY, defValue: null) ??
          Flavor.I.getString(MEMBER_URL)!,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));
    final cgwDio = Dio(BaseOptions(
      baseUrl: SpUtil.getString(CGW_KEY, defValue: null) ??
          Flavor.I.getString(CGW_URL)!,
      connectTimeout: const Duration(milliseconds: 8000),
      sendTimeout: const Duration(milliseconds: 8000),
      receiveTimeout: const Duration(milliseconds: 8000),
    ));

    launchDio.configProxy();
    memberDio.configProxy();
    cgwDio.configProxy();

    errorHandlerDio.configProxy();
  }
}

class HttpProxyAdapter extends IOHttpClientAdapter {
  final String ipAddr;
  final String port;

  HttpProxyAdapter({this.ipAddr = '127.0.0.1', this.port = '8888'}) {
    onHttpClientCreate = (client) {
      final proxy = '$ipAddr:$port';
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };

      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }
}

extension DioExtension on Dio {
  void configProxy() {
    if (SpUtil.getBool("setProxy", defValue: false) ?? false) {
      String ipAddr =
          SpUtil.getString("proxyIp", defValue: "127.0.0.1") as String;
      String port = SpUtil.getString("proxyPort", defValue: "8888") as String;
      httpClientAdapter = HttpProxyAdapter(ipAddr: ipAddr, port: port);
    }
  }
}
