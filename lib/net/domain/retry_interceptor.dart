import 'package:dio/dio.dart';

import 'domain_switch_handler.dart';

class RetryInterceptor extends QueuedInterceptor {
  final DomainSwitchHandler domainHandler;

  RetryInterceptor(this.domainHandler);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    domainHandler.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    domainHandler.onError(err, handler);
  }
}
