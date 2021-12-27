import 'package:flutter/widgets.dart';

import 'frame_animation_image.dart';

///
class LoadingAnimation extends StatelessWidget {
  ///
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameAnimationImage(
      animationList: List<String>.generate(
          77, (int v) => 'assets/images/loading/loading_${v + 1}.png'),
      oneShot: false,
    );
  }
}
