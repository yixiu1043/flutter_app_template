import 'package:flutter/material.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/utils/num_extension.dart';

import '../custom_image/custom_image.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImage(Assets.image.faVideo.path, width: 335.adjusted());
  }
}
