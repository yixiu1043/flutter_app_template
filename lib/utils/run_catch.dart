import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_template/net/exception/server_exception.dart';
import 'package:flutter_app_template/utils/log.dart';
import 'package:flutter_app_template/utils/overlay_extension.dart';

typedef Request = FutureOr<void> Function();
typedef OnError = void Function(dynamic e);

void runCatch(Request request, {OnError? onError}) async {
  try {
    await request();
  } catch (e, stackTrace) {
    dismissAll();
    onError?.call(e);
    Log.e(e, ' ERROR ', stackTrace);
    if (e is DioError && e.error is ServerException) {
      showToast((e.error as ServerException).message);
    }
  }
}
