import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yx_app/flavor/properties.dart';
import 'package:yx_app/initializer/app_initializer.dart';
import 'package:yx_app/net/encrypt_interceptor.dart';
import 'package:yx_app/net/envelope_interceptor.dart';
import 'package:yx_app/net/error_handle_interceptor.dart';
import 'package:yx_app/net/net_status_check_interceptor.dart';
import 'package:yx_app/net/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInitializer implements AppInitializer {
  @override
  FutureOr<void> init() async {
    for (final element in UrlEndpoint.values) {
      final dio = Get.find<Dio>(tag: '${element.name}_url');
      dio.interceptors.addAll([
        NetStatusCheckInterceptor(),
        EncryptInterceptor(
          aesKey: Flavor.I.getString(AES_KEY)!,
          openEncrypt: Flavor.I.getBool(CRYPTO_SWITCH)!,
        ),
        TokenInterceptor(),
        if (!(Flavor.I.getString(API_TYPE) == 'prod' &&
            (kProfileMode || kReleaseMode)))
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
      ]);
      dio.interceptors.addAll([
        EnvelopeInterceptor(
          Flavor.I.getBool(CRYPTO_SWITCH)!,
        ),
        ErrorHandleInterceptor()
      ]);
      /// TODO 封印域名切换
      // if (!Flavor.I.isDevelopment) {
      //   final domainHandler = DomainSwitchHandler(
      //       baseUrl: dio.options.baseUrl,
      //       urlEndpoint: element,
      //       buildInDomains:
      //           Flavor.I.getObject('${element.name}_buildIn') as List<String>);
      //   await domainHandler.init();
      //   dio.interceptors.addAll([
      //     RetryInterceptor(domainHandler),
      //     EnvelopeInterceptor(
      //       Flavor.I.getBool(CRYPTO_SWITCH)!,
      //     ),
      //     ErrorHandleInterceptor()
      //   ]);
      // } else {
      //   dio.interceptors.addAll([
      //     EnvelopeInterceptor(
      //       Flavor.I.getBool(CRYPTO_SWITCH)!,
      //     ),
      //     ErrorHandleInterceptor()
      //   ]);
      // }
    }
  }
}
