import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_app_template/router/app_pages.dart';
import 'package:flutter_app_template/utils/store.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'package:udid/udid.dart';

class Tools {
  Tools._privateConstructor();

  static final Tools _instance = Tools._privateConstructor();

  static Tools get instance => _instance;

  Future<void> getDeviceNo() async {
    try {
      Store.deviceNo = await Udid.udid;
    } on MissingPluginException catch (_) {
      /// 'Failed to get platform version.';
    }
  }

  Future<void> getUserAgent() async {
    try {
      Store.userAgent = await userAgent();
    } catch (_) {
      /// 'Failed to get user agent.';
    }
  }

  String getConfigFromDictionary(String key) {
    final list = Store.dictionaryConfig
        .where((element) => element['key'] == key)
        .toList();
    if (list.isNotEmpty) {
      return list.first['value'];
    }
    return '';
  }

  Size getTextSize(String text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  // String getCurrentTitle() {
  //   const defaultTitle = '美播真人 优惠活动';
  //   if(!GetPlatform.isWeb) {
  //     return defaultTitle;
  //   }
  //   final appPages = AppPages.pages;
  //   final list = appPages.where((element) => element.name == Get.currentRoute);
  //   return list.isNotEmpty ? list.first.title ?? defaultTitle : defaultTitle;
  // }
}
