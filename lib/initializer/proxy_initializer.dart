import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:yx_app/flavor/properties.dart';
import 'package:yx_app/initializer/app_initializer.dart';
import 'package:yx_app/net/domain/domain_switch_handler.dart';
import 'package:sp_util/sp_util.dart';

class ProxyInitializer implements AppInitializer {
  @override
  FutureOr<void> init() {
    for (final element in UrlEndpoint.values) {
      final dio = Get.find<Dio>(tag: '${element.name}_url');
      dio.configJavProxy();
    }

    errorHandlerDio.configJavProxy();
  }
}

class HttpProxyAdapter extends DefaultHttpClientAdapter {
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
  void configJavProxy() {
    if (SpUtil.getBool("setProxy", defValue: false) ?? false) {
      String ipAddr =
          SpUtil.getString("proxyIp", defValue: "127.0.0.1") as String;
      String port = SpUtil.getString("proxyPort", defValue: "8888") as String;
      httpClientAdapter = HttpProxyAdapter(ipAddr: ipAddr, port: port);
    }
  }
}
