import 'dart:io';

import 'package:flutter/foundation.dart';

enum DeviceType {
  unknown,
  pc,
  ios,
  // ignore: constant_identifier_names
  ios_h5,
  // ignore: constant_identifier_names
  android_h5,
  android,
}

int get vendorPlatformDeviceType {
  final bool isDesktop = Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  if (isDesktop) {
    return DeviceType.pc.index;
  }
  if (kIsWeb && Platform.isAndroid) {
    return DeviceType.android_h5.index;
  }
  if (kIsWeb && Platform.isIOS) {
    return DeviceType.ios_h5.index;
  }
  if (!kIsWeb && Platform.isAndroid) {
    return DeviceType.android.index;
  }
  if (!kIsWeb && Platform.isIOS) {
    return DeviceType.ios.index;
  }
  return DeviceType.unknown.index;
}


