import 'package:dio/dio.dart';
import 'package:yx_app/net/exception/network_exception.dart';
import 'package:yx_app/utils/connectivity_manager.dart';

class NetStatusCheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ConnectivityManager.instance.onResume();
    if (!ConnectivityManager.instance.isConnect) {
      final error = DioError(
        requestOptions: options,
        error: NetworkException(),
        type: DioErrorType.other,
      );
      handler.reject(error, true);
    } else {
      handler.next(options);
    }
  }
}
