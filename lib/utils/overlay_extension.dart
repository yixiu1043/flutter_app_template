import 'package:flutter/material.dart';

import '../components/toast/toast_manager.dart';

typedef CancelFunc = void Function();

CancelFunc showToast(String msg,
    {AlignmentGeometry? align = Alignment.center}) {
  ToastManager.showText(msg, align: align);
  return () => ToastManager.dismiss();
}

void dismissAll() {
  ToastManager.dismiss();
}

void dismissLoading() {
  ToastManager.dismiss();
}

CancelFunc showLoading({String? msg}) {
  ToastManager.showLoading(message: msg);
  return () => ToastManager.dismiss();
}

CancelFunc showDelayLoading(
    {String? msg, Duration delay = const Duration(milliseconds: 0)}) {
  Future.delayed(delay).then(
    (value) => ToastManager.showLoading(message: msg),
  );
  return () => ToastManager.dismiss();
}

CancelFunc showSuccess(String msg) {
  ToastManager.showSuccess(
    message: msg,
  );
  return () => ToastManager.dismiss();
}

CancelFunc showError(String msg) {
  ToastManager.showError(
    message: msg,
  );
  return () => ToastManager.dismiss();
}
