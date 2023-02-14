import 'package:get/get.dart';

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
  if (GetPlatform.isDesktop) {
    return DeviceType.pc.index;
  }
  if (GetPlatform.isWeb && GetPlatform.isAndroid) {
    return DeviceType.android_h5.index;
  }
  if (GetPlatform.isWeb && GetPlatform.isIOS) {
    return DeviceType.ios_h5.index;
  }
  if (!GetPlatform.isWeb && GetPlatform.isAndroid) {
    return DeviceType.android.index;
  }
  if (!GetPlatform.isWeb && GetPlatform.isIOS) {
    return DeviceType.ios.index;
  }
  return DeviceType.unknown.index;
}
