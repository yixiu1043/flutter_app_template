import 'package:flutter/material.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';

const _kDividerColor = ColorName.color414660A40;

class YxDivider extends StatelessWidget {
  /// 分割线的或者分割条的颜色 可以通过[BrnThemeConfigurator]配置默认颜色
  final Color? color;

  /// 分割线的或者分割条的高度 默认0.5
  final double height;

  /// 左边缩进距离
  final double leftInset;

  /// 右边缩进距离
  final double rightInset;

  const YxDivider({
    Key? key,
    this.color,
    this.height = 1,
    this.leftInset = 0,
    this.rightInset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftInset, right: rightInset),
      child: Divider(
        thickness: height,
        height: height,
        color: color ?? _kDividerColor,
      ),
    );
  }
}
