import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter_app_template/flavor/properties.dart';
import 'package:flutter_app_template/initializer/app_initializer.dart';
import 'package:flutter_app_template/net/domain/domain_switch_handler.dart';
import 'package:sp_util/sp_util.dart';

import '../domain/domain.dart';

class ProxyInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    for (final dio in domains) {
      dio.configProxy();
    }

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
