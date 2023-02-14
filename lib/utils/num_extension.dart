import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yx_app/utils/browser.dart';

extension NumExtension on num {
  // mobile直接用.w适配，PC端显示移动端用等比适配公式： x / 375 = y / 500，已知x，求y。
  double adjusted() {
    if (!isMobile()) {
      return this * 500 / 375;
    }
    final d = this * 1;
    return d.w;
  }
}
