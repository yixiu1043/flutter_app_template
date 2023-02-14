import 'package:flutter/material.dart';
import 'package:yx_app/components/yx_image/yx_image.dart';
import 'package:yx_app/gen/assets.gen.dart';
import 'package:yx_app/utils/num_extension.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return YxImage(Assets.image.faVideo.path, width: 335.adjusted());
  }
}
