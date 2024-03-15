import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/flavor/properties.dart';
import 'package:flutter_app_template/initializer/proxy_initializer.dart';
import 'package:flutter_app_template/net/model/res/domain_config.dart';
import 'package:flutter_app_template/net/encrypt_interceptor.dart';
import 'package:flutter_app_template/net/envelope_interceptor.dart';
import 'package:flutter_app_template/utils/device_type.dart';
import 'package:flutter_app_template/utils/log.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sp_util/sp_util.dart';

final Dio errorHandlerDio = Dio()
  ..interceptors.addAll([
    EncryptInterceptor(
      aesKey: Flavor.I.getString(AES_KEY)!,
      openEncrypt: Flavor.I.getBool(CRYPTO_SWITCH)!,
    ),
    if (!(Flavor.I.getString(API_TYPE) == 'prod' &&
        (kProfileMode || kReleaseMode)))
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    EnvelopeInterceptor(
      Flavor.I.getBool(CRYPTO_SWITCH)!,
    ),
  ]);

final Dio _simpleDio = Dio();

// ignore: constant_identifier_names
const String LAUNCH_KEY = 'launch_key';
// ignore: constant_identifier_names
const String CGW_KEY = 'cgw_key';
// ignore: constant_identifier_names
const String MEMBER_KEY = 'member_key';

class DomainSwitchHandler {
  final Dio retryDio;

  final List<String> _invalidDomains = [];
  final List<String> _validDomains = [];
  final List<String> buildInDomains;
  final UrlEndpoint urlEndpoint;

  var _currentUrl = '';

  String get currentUrl => _currentUrl;

  Iterable<String> get invalidDomains => _invalidDomains;

  Iterable<String> get validDomains => _validDomains;

  DomainSwitchHandler({
    Dio? customDio,
    required String baseUrl,
    this.urlEndpoint = UrlEndpoint.cgw,
    this.buildInDomains = const <String>[],
  }) : retryDio = customDio ?? errorHandlerDio {
    bool isOpenProxy = SpUtil.getBool("setProxy", defValue: false) ?? false;
    if (isOpenProxy) {
      String ipAddr =
          SpUtil.getString("proxyIp", defValue: "127.0.0.1") as String;
      String port = SpUtil.getString("proxyPort", defValue: "8888") as String;
      retryDio.httpClientAdapter = HttpProxyAdapter(ipAddr: ipAddr, port: port);
    }
    _currentUrl = baseUrl;
    _validDomains.addAll(buildInDomains);
  }

  Future<void> init() async {
    await _fetchBackendDomains();
  }

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_currentUrl.isEmpty) {
      _currentUrl = options.baseUrl;
    }
    handler.next(options.copyWith(baseUrl: _currentUrl));
  }

  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (!err.requestOptions.extra.containsKey('retry')) {
      err.requestOptions.extra
          .putIfAbsent('originUrl', () => err.requestOptions.uri.toString());
    }
    if (err.type == DioExceptionType.connectionError && err.error is SocketException) {
      await checkNetworkStatus(err, handler);
      return;
    }
    if (err.type == DioExceptionType.connectionError && err.error is HttpException) {
      await _retryRequest(err, handler);
      return;
    }
    if (err.type == DioExceptionType.unknown && err.error is FormatException) {
      await _retryRequest(err, handler);
      return;
    }
    if (err.type == DioExceptionType.connectionTimeout) {
      await _retryRequest(err, handler);
      return;
    }
    if (err.type == DioExceptionType.badResponse &&
        ((err.response?.statusCode ?? 0) >= 500)) {
      await _retryRequest(err, handler);
      return;
    }
    handler.next(err);
  }

  Future<void> checkNetworkStatus(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    const url = 'https://www.baidu.com/y1979';
    try {
      await _simpleDio.get(url);
    } catch (e) {
      if (e is DioException && e.response != null) {
        await _retryRequest(err, handler);
        return;
      }
    }
    handler.next(err);
  }

  Future<void> _retryRequest(
      DioException err, ErrorInterceptorHandler handler) async {
    _invalidDomains.add(err.requestOptions.baseUrl);
    final domains = _filterValidDomains().toSet().toList();

    bool _handleResponse(Response response) {
      if (response.statusCode == 200) {
        final url = Uri.parse(response.requestOptions.uri.toString());
        _currentUrl = 'https://${url.authority}/client-gateway/client-server';
        SpUtil.putString('${urlEndpoint.name}_key', _currentUrl);
        if (domains.length <= 5) {
          _fetchBackendDomains();
        }
        handler.resolve(response);
        return true;
      }
      return false;
    }

    if (_forceQueuedRetry(err)) {
      for (var domain in domains) {
        try {
          final retryExtra = err.requestOptions.extra;
          retryExtra.putIfAbsent('retry', () => true);
          final response = await retryDio.fetch(
              err.requestOptions.copyWith(baseUrl: domain, extra: retryExtra));
          if (_handleResponse(response)) return;
        } catch (e) {
          if (e is DioException) {
            if (!_invalidDomains.contains(err.requestOptions.uri.toString())) {
              _invalidDomains.add(err.requestOptions.uri.toString());
            }
          }
          continue;
        }
      }
    } else {
      final groupDomains = domains
          .windowed(3, step: 3, partialWindows: true)
          .toList(growable: false);
      for (final group in groupDomains) {
        try {
          final response = await _parallelRetry(group, err);
          if (_handleResponse(response)) return;
        } catch (e) {
          if (!_invalidDomains.contains(err.requestOptions.uri.toString())) {
            _invalidDomains.add(err.requestOptions.uri.toString());
          }
          continue;
        }
      }
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _parallelRetry(
      List<String> domains, DioException err) async {
    var errorCount = 0;
    final completer = Completer<Response<dynamic>>();
    if (domains.isEmpty) {
      completer.completeError(err);
      return completer.future;
    }

    void _handleDomain(String domain) {
      final retryExtra = err.requestOptions.extra;
      retryExtra.putIfAbsent('retry', () => true);
      retryDio
          .fetch(err.requestOptions.copyWith(
        baseUrl: domain,
        extra: retryExtra,
      ))
          .then((value) {
        if (!completer.isCompleted) {
          completer.complete(value);
        }
      }).onError((error, stackTrace) {
        errorCount++;
        if (error is DioException) {
          if (!_invalidDomains.contains(error.requestOptions.uri.toString())) {
            _invalidDomains.add(error.requestOptions.uri.toString());
          }
        }
        if (!completer.isCompleted && errorCount >= domains.length) {
          completer.completeError(err);
        }
      });
    }

    for (final domain in domains) {
      _handleDomain(domain);
    }
    return completer.future;
  }

  List<String> _filterValidDomains() {
    final List<String> rest =
        _validDomains.where((o) => !_invalidDomains.contains(o)).toList();
    if (rest.isEmpty) {
      _invalidDomains.clear();
      return _filterValidDomains();
    }
    return rest;
  }

  bool _forceQueuedRetry(DioException err) {
    if (err.requestOptions.uri.toString().contains('jav/registerLogin')) {
      return true;
    }
    return false;
  }

  Future<void> _fetchBackendDomains() async {
    try {
      final _headers = <String, dynamic>{
        'merchant-id': Flavor.I.getString(MERCHANT_ID),
        'ob-application': 20,
        'ob-client': vendorPlatformDeviceType,
      };
      final _data = {
        'number': 5,
        'biztype': (urlEndpoint.index + 1),
      };

      final _result = await retryDio.fetch<List<dynamic>>(
        RequestOptions(
          path: '/jav/system/configDomain/query4List',
          baseUrl: _currentUrl,
          method: 'POST',
          headers: _headers,
          data: _data,
        ),
      );
      if (_result.statusCode == 200 && _result.data != null) {
        final List<String> updateDomains = _result.data!
            .map((e) => JsonMapper.deserialize<DomainConfig>(e))
            .whereNotNull()
            .where((element) => element.domainStatus == 1)
            .map((e) => "https://${e.domain}/client-gateway/client-server")
            .toList();
        for (var element in updateDomains) {
          if (!_validDomains.contains(element)) {
            _validDomains.add(element);
          }
        }
      }
    } catch (e, s) {
      Log.e('域名获取错误', e, s);
    }
  }
}

extension _IterableWindowed<E> on Iterable<E> {
  Iterable<List<E>> windowed(
    int size, {
    int step = 1,
    bool partialWindows = false,
  }) sync* {
    final gap = step - size;
    if (gap >= 0) {
      var buffer = <E>[];
      var skip = 0;
      for (final element in this) {
        if (skip > 0) {
          skip -= 1;
          continue;
        }
        buffer.add(element);
        if (buffer.length == size) {
          yield buffer;
          buffer = <E>[];
          skip = gap;
        }
      }
      if (buffer.isNotEmpty && (partialWindows || buffer.length == size)) {
        yield buffer;
      }
    } else {
      final buffer = ListQueue<E>(size);
      for (final element in this) {
        buffer.add(element);
        if (buffer.length == size) {
          yield buffer.toList();
          for (var i = 0; i < step; i++) {
            buffer.removeFirst();
          }
        }
      }
      if (partialWindows) {
        while (buffer.length > step) {
          yield buffer.toList();
          for (var i = 0; i < step; i++) {
            buffer.removeFirst();
          }
        }
        if (buffer.isNotEmpty) {
          yield buffer.toList();
        }
      }
    }
  }
}
