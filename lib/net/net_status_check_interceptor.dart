import 'package:dio/dio.dart';
import 'package:flutter_app_template/net/exception/network_exception.dart';
import 'package:flutter_app_template/utils/connectivity_manager.dart';

class NetStatusCheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ConnectivityManager.instance.onResume();
    if (!ConnectivityManager.instance.isConnect) {
      final error = DioException(
        requestOptions: options,
        error: NetworkException(),
        type: DioExceptionType.unknown, // TODO dio升级新增的枚举，检查是否可用在此处
      );
      handler.reject(error, true);
    } else {
      handler.next(options);
    }
  }
}
