import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/yx_image/yx_image.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/utils/num_extension.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return YxImage(Assets.image.faVideo.path, width: 335.adjusted());
  }
}
