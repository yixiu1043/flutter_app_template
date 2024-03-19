import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/utils/fake.dart'
    if (dart.library.html) 'dart:html';
import 'package:url_launcher/url_launcher.dart';

RegExp mobileExp = RegExp(r"(AppleWebKit.*Mobile.*)");
RegExp iosExp = RegExp(r"(\(i[^;]+;( U;)? CPU.+Mac OS X)");
RegExp qqExp = RegExp(r"(\sQQ)", caseSensitive: false);

Map<String, bool> getBrowser() {
  // ignore:undefined_prefixed_name
  var u = window.navigator.userAgent;
  return {
    'trident': u.contains("Trident"),
    //IE内核
    'presto': u.contains("Presto"),
    //opera内核
    'webKit': u.contains("AppleWebKit"),
    //苹果、谷歌内核
    'gecko': u.contains("Gecko") && !u.contains("KHTML"),
    //火狐内核
    'mobile': !!mobileExp.hasMatch(u),
    //是否为移动终端
    'ios': !!iosExp.hasMatch(u),
    //ios终端
    'android': u.contains("Android") || u.contains("Linux"),
    //android终端或者uc浏览器
    'iPhone': u.contains("iPhone"),
    //是否为iPhone或者QQHD浏览器
    'iPad': u.contains("iPad"),
    //是否iPad
    'webApp': !u.contains("Safari"),
    //是否web应该程序，没有头部与底部
    'weixin': u.contains("MicroMessenger"),
    //是否微信 （2015-01-22新增）
    'qq': qqExp.hasMatch(u),
    //是否QQ
  };
}

bool isMobile() {
  if (kIsWeb) {
    var browser = getBrowser();
    return (browser['mobile']! || browser['android']! || browser['ios']!);
  }
  return true;
}

// 跳转下载页
void toDownloadPage() {
  // ignore:undefined_prefixed_name
  var href = window.location.href;
  if (href.contains('mb0.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=4531098'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb5.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=2575440'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb4.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=7233465'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb7.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=0148907'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb00.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=7476192'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb05.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=6384386'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb02.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=0964160'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb06.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=8357846'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb03.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=5450017'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  if (href.contains('mb07.live')) {
    launchUrl(
      Uri.parse('https://www.fqphg427.com/?i_code=4964559'),
      mode: LaunchMode.externalApplication,
    );
    return;
  }
  launchUrl(
    Uri.parse('https://www.fqphg427.com/ '),
    mode: LaunchMode.externalApplication,
  );
}
