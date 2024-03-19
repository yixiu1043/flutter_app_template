import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/divider/yx_divider.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

typedef ActionSheetItemClickCallBack = void Function(
    int index, CustomActionSheetItem actionItem);

typedef ActionSheetItemClickInterceptor = bool Function(
    int index, CustomActionSheetItem actionItem);

const EdgeInsets _kContentPadding = EdgeInsets.symmetric(vertical: 14);
const Color _kSeparatorLineColor = Color(0x245E6AA9);
const Color _kActionBackgroundColor = Color(0xff242943);
const TextStyle _kActionStyle =
    TextStyle(fontSize: 15, color: ColorName.colorE8E8E8A100);
const TextStyle _kCancelActionStyle =
    TextStyle(fontSize: 15, color: ColorName.colorE8E8E8A100);

class CustomActionSheetItem {
  /// 标题文字
  String title;

  /// 主标题文本样式
  final TextStyle? titleStyle;

  CustomActionSheetItem(
    this.title, {
    this.titleStyle,
  });
}

class CustomActionSheet extends StatelessWidget {
  /// 每个选项相关的配置信息的列表
  /// 每个选项支持修改内容见[BrnCommonActionSheetItem]
  final List<CustomActionSheetItem> actions;

  /// Action 之间分割线颜色
  final Color? separatorLineColor;

  /// 取消按钮与 Action 之间的分割线的颜色
  final Color spaceColor;

  /// 取消按钮文本
  final String? cancelTitle;

  /// 标题最大行数，默认为1
  final int maxTitleLines;

  /// 列表最大高度限制，默认为屏幕高度减去上下安全距离
  /// 默认为0
  final double maxSheetHeight;

  /// Action Item 的点击事件
  final ActionSheetItemClickCallBack? clickCallBack;

  /// Action Item 点击事件拦截回调
  final ActionSheetItemClickInterceptor? onItemClickInterceptor;

  const CustomActionSheet({
    Key? key,
    required this.actions,
    this.cancelTitle,
    this.clickCallBack,
    this.separatorLineColor,
    this.spaceColor = const Color(0xff414660),
    this.maxTitleLines = 1,
    this.maxSheetHeight = 0,
    this.onItemClickInterceptor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQueryData.fromWindow(window).padding;
    double maxHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    double _maxSheetHeight = 0;

    if (maxSheetHeight <= 0 || maxSheetHeight > maxHeight) {
      _maxSheetHeight = maxHeight;
    }
    return GestureDetector(
      child: Container(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          child:
              SafeArea(child: _configActionWidgets(context, _maxSheetHeight))),
      onVerticalDragUpdate: (v) => {},
    );
  }

  /// 构建actionSheet的按钮
  Widget _configActionWidgets(BuildContext context, double _maxSheetHeight) {
    List<Widget> widgets = [];
    widgets.add(_configListActions(context));
    // 添加间隔
    widgets.add(Divider(
      color: spaceColor,
      thickness: 4,
      height: 4,
    ));
    widgets.add(_configCancelAction(context));

    return Container(
      constraints: BoxConstraints(maxHeight: _maxSheetHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  /// 构建列表widget
  Widget _configListActions(BuildContext context) {
    List<Widget> tiles = [];
    //构建列表内容
    for (int index = 0; index < actions.length; index++) {
      tiles.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: _kActionBackgroundColor,
            padding: _kContentPadding,
            child: _configTile(actions[index]),
          ),
          onTap: () {
            if (onItemClickInterceptor == null ||
                !onItemClickInterceptor!(index, actions[index])) {
              // 推荐使用回调方法处理点击事件!!!!!!!!!!
              if (clickCallBack != null) {
                clickCallBack!(index, actions[index]);
              }
              // 如果未拦截，则pop掉当前页面，并且携带信息（不建议使用此信息进行点击时间处理）
              Navigator.of(context).pop([index, actions[index]]);
            }
          },
        ),
      );
      tiles.add(YxDivider(
        color: separatorLineColor ?? _kSeparatorLineColor,
      ));
    }
    return Flexible(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: tiles,
      ),
    );
  }

  // 配置每个选项内部信息
  // action 每个item配置项 [BrnCommonActionSheetItem]
  Widget _configTile(CustomActionSheetItem action) {
    List<Widget> tileElements = [];
    // 添加标题
    tileElements.add(Center(
      child: Text(
        action.title,
        maxLines: 1,
        style: action.titleStyle ?? _kActionStyle,
      ),
    ));
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: tileElements);
  }

  /// 构建取消操作按钮
  Widget _configCancelAction(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: _kActionBackgroundColor,
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Center(
          child: Text(
            cancelTitle ?? "取消",
            style: _kCancelActionStyle,
          ),
        ),
      ),
    );
  }
}

Future<T?> showCustomActionSheet<T>(
  BuildContext context,
  List<CustomActionSheetItem> actions, {
  String? cancelTitle,
  Color? bottomSheetColor,
  double? borderRadius,
  ActionSheetItemClickCallBack? clickCallBack,
  ActionSheetItemClickInterceptor? onItemClickInterceptor,
}) {
  final BottomSheetThemeData sheetTheme = Theme.of(context).bottomSheetTheme;
  return showModalBottomSheet<T>(
    context: context,
    elevation: 0,
    barrierColor: Colors.transparent,
    backgroundColor: bottomSheetColor ??
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
    builder: (BuildContext context) {
      return CustomActionSheet(
        actions: actions,
        cancelTitle: cancelTitle,
        clickCallBack: clickCallBack,
        onItemClickInterceptor: onItemClickInterceptor,
      );
    },
  );
}

