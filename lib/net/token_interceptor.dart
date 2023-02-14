import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:yx_app/flavor/properties.dart';
import 'package:yx_app/utils/device_type.dart';
import 'package:yx_app/utils/store.dart';
import 'package:sp_util/sp_util.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = SpUtil.getString('token');
    if (token != null && token.isNotEmpty) {
      options.headers['x-request-token'] = token;
    }
    options.headers['merchant-id'] = Flavor.I.getString(MERCHANT_ID);
    options.headers['ob-application'] = 20;
    options.headers['ob-client'] = vendorPlatformDeviceType;
    options.headers['deviceNo'] = Store.deviceNo;
    options.headers['user-agent'] = Store.userAgent;
    handler.next(options);
  }
}
