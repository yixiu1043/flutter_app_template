import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_template/components/dialog/yx_dialog.dart';
import 'package:flutter_app_template/components/loading/yx_loading.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

///
typedef CancelFunc = void Function();
typedef ToastCallback = void Function(CancelFunc c);
typedef CloseWidgetBuilder = Widget Function(CancelFunc c);
typedef ContentConditionChildBuilder = Widget Function(CancelFunc c);

/// toast 管理器
class ToastManager {
  ToastManager._privateConstructor();

  /// 初始化
  static TransitionBuilder init() {
    return BotToastInit();
  }

  /// 初始化
  static TransitionBuilder initWithParameters({TransitionBuilder? builder}) {
    final TransitionBuilder toastBuilder = BotToastInit();
    if (builder == null) return toastBuilder;
    return (BuildContext context, Widget? child) {
      return toastBuilder(context, builder(context, child));
    };
  }

  static void dismiss() {
    BotToast.closeAllLoading();
  }

  static CancelFunc showText(String message,
      {AlignmentGeometry? align = Alignment.center}) {
    BotToast.removeAll(BotToast.textKey);
    return BotToast.showCustomText(
        onlyOne: true,
        duration: const Duration(seconds: 2),
        align: align,
        wrapAnimation: null,
        wrapToastAnimation: null,
        toastBuilder: (_) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: ColorName.color414660.withOpacity(0.8),
            ),
            constraints: const BoxConstraints(
              minWidth: 300,
              minHeight: 60,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 52),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
            ),
          );
        });
  }

  static CancelFunc showSuccess({String? message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Container(
            width: 96,
            height: 96,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Text(
                      message ?? "comp_toast_su".tr,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  static CancelFunc showError({String? message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Container(
            width: 96,
            height: 96,
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 40,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Text(
                      message ?? "comp_toast_fail".tr,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  static CancelFunc showLoading({String? message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 1000),
        toastBuilder: (_) {
          return YxLoading(content: message);
        });
  }

  static CancelFunc dialog({
    Key? key,
    required String title,
    required String content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    String? confirmText,
    String? cancelText,
    TextStyle? cancelTextStyle,
    TextStyle? confirmTextTextStyle,
    ContentConditionChildBuilder? contentConditionChild,
    Color? background,
    ToastCallback? onCancelListener,
    ToastCallback? onConfirmListener,
    CloseWidgetBuilder? closeWidgetBuilder,
  }) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        allowClick: false,
        animationDuration: const Duration(milliseconds: 300),
        groupKey: '_dialog_key',
        onlyOne: true,
        backgroundColor: Colors.black54,
        duration: const Duration(seconds: 1000),
        toastBuilder: (c) {
          return YxDialog.alert(
            title: title,
            content: content,
            titleStyle: titleStyle,
            contentStyle: contentStyle,
            confirmText: confirmText,
            cancelText: cancelText,
            cancelTextStyle: cancelTextStyle,
            closeWidget: closeWidgetBuilder?.call(c),
            onCancelListener: () => onCancelListener?.call(c),
            onConfirmListener: () => onConfirmListener?.call(c),
            confirmTextTextStyle: confirmTextTextStyle,
            contentConditionChild: contentConditionChild?.call(c),
            background: background,
          );
        });
  }

  static CancelFunc dialogExit({
    Key? key,
    required String title,
    required String content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    String? confirmText,
    String? cancelText,
    TextStyle? cancelTextStyle,
    TextStyle? confirmTextTextStyle,
    ContentConditionChildBuilder? contentConditionChild,
    Color? background,
    ToastCallback? onCancelListener,
    ToastCallback? onConfirmListener,
    CloseWidgetBuilder? closeWidgetBuilder,
  }) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        allowClick: false,
        animationDuration: const Duration(milliseconds: 300),
        groupKey: '_dialog_key_exit',
        onlyOne: true,
        backgroundColor: Colors.black54,
        duration: const Duration(seconds: 1000),
        toastBuilder: (c) {
          return YxDialog.alert(
            title: title,
            content: content,
            titleStyle: titleStyle,
            contentStyle: contentStyle,
            confirmText: confirmText,
            // cancelText: cancelText,
            // cancelTextStyle: cancelTextStyle,
            closeWidget: closeWidgetBuilder?.call(c),
            // onCancelListener: () => onCancelListener?.call(c),
            onConfirmListener: () => onConfirmListener?.call(c),
            confirmTextTextStyle: confirmTextTextStyle,
            contentConditionChild: contentConditionChild?.call(c),
            background: background,
          );
        });
  }

}

/// 二次封装
class ToastObserver extends BotToastNavigatorObserver {}
