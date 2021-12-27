import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'loading_animation.dart';

/// 加载-上拉-底部
class RefreshFooter extends LoadIndicator {
  ///
  const RefreshFooter({
    Key? key,
    VoidCallback? onClick,
    LoadStyle loadStyle = LoadStyle.ShowAlways,
    double height = 60.0,
  }) : super(
    key: key,
    loadStyle: loadStyle,
    height: height,
    onClick: onClick,
  );

  @override
  _ObRefreshFooterState createState() => _ObRefreshFooterState();
}

class _ObRefreshFooterState extends LoadIndicatorState<RefreshFooter> {
  @override
  Widget buildContent(BuildContext context, LoadStatus mode) {
    switch (mode) {
      case LoadStatus.idle:
        return SizedBox(
          height: widget.height,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.arrow_upward, color: Colors.grey),
                Text('上拉加载')
              ],
            ),
          ),
        );
      case LoadStatus.noMore:
        return SizedBox(
          height: widget.height,
          child: Center(
              child: Text(
                '- 我也是有底线的 -',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )),
        );
      case LoadStatus.canLoading:
      case LoadStatus.loading:
      case LoadStatus.failed:
        return SizedBox(
          child: const Center(
            child: LoadingAnimation(),
          ),
          height: widget.height,
        );
    }
  }
}
