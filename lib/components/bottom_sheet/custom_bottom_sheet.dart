import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/button/button_size.dart';
import 'package:flutter_app_template/components/button/primary_button.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? confirm;
  final Widget? contentWidget;
  final VoidCallback? onConfirm;

  const CustomBottomSheet({
    Key? key,
    this.contentWidget,
    required this.title,
    this.confirm,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 36,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: ColorName.colorE8E8E8A100,
                  ),
                ),
              ),
              if (contentWidget != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: contentWidget!,
                ),
              if (confirm != null)
                PrimaryButton(
                  onPressed: () {
                    if (onConfirm != null) onConfirm!();
                  },
                  block: true,
                  size: ButtonSize.large,
                  child: Text(
                    confirm ?? '确认',
                  ),
                )
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 16,
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Assets.image.icon.iconClose.image(width: 16),
          ),
        ),
      ],
    );
  }
}

Future<T?> showCustomBottomSheet<T>(
    BuildContext context,
    Widget bottomSheet, {
      Color? backgroundColor,
      double? elevation,
      double? borderRadius,
      ShapeBorder? shape,
      Clip? clipBehavior,
      Color? barrierColor,
      bool useSafeArea = false,
      bool isScrollControlled = false,
      bool useRootNavigator = true,
      bool isDismissible = true,
      bool enableDrag = true,
      RouteSettings? settings,
      Duration? enterBottomSheetDuration,
      Duration? exitBottomSheetDuration,
    }) {
  final BottomSheetThemeData sheetTheme = Theme.of(context).bottomSheetTheme;
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    barrierColor: Colors.transparent,
    useSafeArea: useSafeArea,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    routeSettings: settings,
    backgroundColor: backgroundColor ??
        sheetTheme.modalBackgroundColor ??
        sheetTheme.backgroundColor,
    clipBehavior: Clip.antiAlias,
    shape: sheetTheme.shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius ?? 12),
            topRight: Radius.circular(borderRadius ?? 12),
          ),
        ),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    builder: (BuildContext context) => bottomSheet,
  );
}
