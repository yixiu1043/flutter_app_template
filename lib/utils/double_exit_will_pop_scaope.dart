import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:yx_app/utils/cool_down_manager.dart';

class DoubleExitWillPopScope extends StatelessWidget {
  final Widget child;
  final ValueGetter? onWillIntercept;
  final VoidCallback? onIntercept;
  final VoidCallback? onHandle;

  const DoubleExitWillPopScope({
    Key? key,
    required this.child,
    this.onIntercept,
    this.onWillIntercept,
    this.onHandle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        if (GetPlatform.isAndroid) {
          if (onWillIntercept?.call() == false) {
            return false;
          }
          final isHandle = await CoolDownManager.instance.check(
            key: 'onIntercept',
            duration: 3000,
          );
          if (isHandle) {
            onIntercept?.call();
            return false;
          }
        }
        onHandle?.call();
        return true;
      },
    );
  }
}
