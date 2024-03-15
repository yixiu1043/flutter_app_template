import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/button/button_size.dart';
import 'package:flutter_app_template/components/button/primary_button.dart';
import 'package:flutter_app_template/components/button/secondary_button.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.only(top: 16, left: 20, bottom: 30, right: 20);

const RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

const TextStyle _defaultConfirmTextStyle = TextStyle(height: 1, fontSize: 15);

const TextStyle _defaultCancelTextStyle = TextStyle(height: 1, fontSize: 15);

class YxDialog extends StatelessWidget {
  ///
  const YxDialog({
    Key? key,
    this.insetPadding,
    this.shape,
    this.background,
    this.titleWidget,
    this.contentWidget,
    this.actionsWidget,
    this.closeWidget,
  }) : super(key: key);

  ///
  YxDialog.alert({
    Key? key,
    required String title,
    required String content,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    String? confirmText,
    String? cancelText,
    TextStyle? cancelTextStyle,
    TextStyle? confirmTextTextStyle,
    Widget? contentConditionChild,
    this.background,
    VoidCallback? onCancelListener,
    VoidCallback? onConfirmListener,
    this.closeWidget,
  })  : shape = _defaultDialogShape,
        insetPadding = _defaultInsetPadding,
        titleWidget = Text(
          title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        contentWidget = Padding(
          padding: const EdgeInsets.only(top: 22, bottom: 24),
          child: Column(
            children: [
              Text(content, style: contentStyle),
              if (contentConditionChild != null) contentConditionChild
            ],
          ),
        ),
        actionsWidget = Row(
          children: <Widget>[
            if (onCancelListener != null)
              Expanded(
                child: SecondaryButton(
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onCancelListener,
                  child: Text(
                    cancelText ?? '取消',
                    textAlign: TextAlign.center,
                    style: cancelTextStyle ?? _defaultCancelTextStyle,
                  ),
                ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 35),
            if (onConfirmListener != null)
              Expanded(
                child: PrimaryButton(
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onConfirmListener,
                  child: Text(
                    confirmText ?? '确定',
                    textAlign: TextAlign.center,
                    style: confirmTextTextStyle ?? _defaultConfirmTextStyle,
                  ),
                ),
              )
          ],
        ),
        super(key: key);

  ///
  YxDialog.alertSlot({
    Key? key,
    required String title,
    required Widget content,
    Widget? close,
    String? confirmText,
    String? cancelText,
    TextStyle? cancelTextStyle,
    TextStyle? confirmTextTextStyle,
    this.background,
    VoidCallback? onCancelListener,
    VoidCallback? onConfirmListener,
  })  : shape = _defaultDialogShape,
        insetPadding = _defaultInsetPadding,
        titleWidget = Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        contentWidget = content,
        closeWidget = close,
        actionsWidget = Row(
          children: <Widget>[
            if (onCancelListener != null)
              Expanded(
                child: SecondaryButton(
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onCancelListener,
                  child: Text(
                    cancelText ?? '取消',
                    textAlign: TextAlign.center,
                    style: cancelTextStyle ?? _defaultCancelTextStyle,
                  ),
                ),
              ),
            if (onCancelListener != null && onConfirmListener != null)
              const SizedBox(width: 35),
            if (onConfirmListener != null)
              Expanded(
                child: PrimaryButton(
                  size: ButtonSize.large,
                  block: true,
                  onPressed: onConfirmListener,
                  child: Text(
                    confirmText ?? '确定',
                    textAlign: TextAlign.center,
                    style: confirmTextTextStyle ?? _defaultConfirmTextStyle,
                  ),
                ),
              )
          ],
        ),
        super(key: key);

  final EdgeInsets? insetPadding;

  final Color? background;

  final ShapeBorder? shape;

  final Widget? titleWidget;

  final Widget? contentWidget;

  final Widget? actionsWidget;

  final Widget? closeWidget;

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = Theme.of(context).dialogTheme;
    return Dialog(
      shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: background ?? dialogTheme.backgroundColor,
      child: Stack(
        children: [
          Container(
            padding: insetPadding ?? _defaultInsetPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (titleWidget != null)
                  DefaultTextStyle(
                    style: dialogTheme.titleTextStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                    child: Center(child: titleWidget!),
                  ),
                if (contentWidget != null)
                  DefaultTextStyle(
                    style: dialogTheme.contentTextStyle ??
                        const TextStyle(
                          color: ColorName.color888888,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                    child: Center(child: contentWidget!),
                  ),
                if (actionsWidget != null) actionsWidget!,
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 12,
            child: closeWidget != null
                ? closeWidget!
                : GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Assets.image.icon.iconClose.image(width: 30),
                  ),
          ),
        ],
      ),
    );
  }
}
