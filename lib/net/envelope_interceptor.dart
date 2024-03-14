import 'package:dio/dio.dart';
import 'package:yx_app/net/exception/auth_fail_exception.dart';

import 'exception/server_exception.dart';

const List ERR_CODE = [
  20000, // 您长时间没有操作，为保证安全使用，请重新登录
  20001, // 您的账号在其他端登录
  20002, // 您的账号已被禁用
  20003, // 无效权限
  20004, // 代理账号被登录锁定
  20005, // 代理你的账号在其他设备已登录，若非本人操作，请及时修改密码
  4004, // TOKEN失效
  4091, // 服务器维护
];

class EnvelopeInterceptor extends Interceptor {
  final bool openEncrypt;

  EnvelopeInterceptor(this.openEncrypt);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (openEncrypt) {
      super.onRequest(options, handler);
      return;
    }
    if (options.responseType == ResponseType.plain) {
      options.responseType = ResponseType.json;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.extra.containsKey('skip')) {
      handler.next(response);
      return;
    }
    final data = response.data;
    if (data is Map<String, dynamic> && _isServerResponse(data)) {
      final code = data['code'];
      final message = data['msg'];
      if (code == 200) {
        response.data = data['data'];
        handler.next(response);
      } else if (ERR_CODE.contains(code)) {
        final error = DioException(
          type: DioExceptionType.badResponse,
          error: AuthFailException(code, message),
          requestOptions: response.requestOptions,
        );
        handler.reject(error, true);
      } else {
        final error = DioException(
          type: DioExceptionType.unknown,
          error: ServerException(code, message),
          requestOptions: response.requestOptions,
        );
        handler.reject(error, true);
      }
    } else {
      handler.next(response);
    }
  }

  bool _isServerResponse(Map<String, dynamic> data) {
    return data['msg'] != null && data['code'] != null;
  }
}
