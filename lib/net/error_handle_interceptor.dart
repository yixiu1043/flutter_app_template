import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yx_app/const/action.dart';
import 'package:yx_app/net/exception/auth_fail_exception.dart';
import 'package:yx_app/net/exception/network_exception.dart';
import 'package:yx_app/net/exception/server_exception.dart';
import 'package:yx_app/utils/overlay_extension.dart';

class ErrorHandleInterceptor extends Interceptor {
  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    // Do something with response error
    if (err.error is NetworkException) {
      handleError(
        '您的网络已断开，\n请连接wifi或蜂窝网络！',
        requestOptions: err.requestOptions,
      );
      return handler.next(err);
    } else if (err.error is AuthFailException) {
      final message = (err.error as AuthFailException).message;
      // final code = (err.error as AuthFailException).code;
      showToast(message);
      return handler.next(err);
    } else if (err.error is ServerException) {
      handleError(
        err.error.message,
        align: Alignment.center,
        requestOptions: err.requestOptions,
      );
      return handler.next(err);
    }
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.cancel:
      case DioErrorType.other:
        handleError(
          '内容超时了，请稍后再试',
          requestOptions: err.requestOptions,
        );
        break;
      case DioErrorType.response:
        final data = err.response?.data;
        if (err.response?.statusCode == 503 || data['code'] == 4091) {
          showToast('服务升级中，请稍后访问');
          return handler.next(err); //continue
        }
        handleError(
          data is Map ? data['msg'] : '服务异常，请稍后再试',
          align: Alignment.center,
          requestOptions: err.requestOptions,
        );
        break;
    }
    return handler.next(err); //continue
    // If you want to resolve the request with some custom data，
    // you can resolve a `Response` object eg: `handler.resolve(response)`.
  }
}

void handleError(
  String message, {
  required RequestOptions requestOptions,
  String? title,
  Alignment align = Alignment.center,
}) {
 if (requestOptions.extra.containsKey('silent')) {
    dispatch(ACTION.silent, {});
  } else {
    dispatch(ACTION.toast, {'message': message, 'align': align});
  }
}

void dispatch(ACTION action, Map<String, dynamic> payload) {
  switch (action) {
    case ACTION.toast:
      dismissAll();
      showToast(payload['message']!, align: payload['align']);
      break;
    case ACTION.silent:
      // Nothing to do
      break;
  }
}
