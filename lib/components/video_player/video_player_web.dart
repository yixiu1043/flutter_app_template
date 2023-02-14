import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yx_app/flavor/properties.dart';
import 'package:yx_app/utils/fake.dart'
    if (dart.library.html) 'dart:html';
import 'package:yx_app/utils/fake.dart' if (dart.library.html) 'dart:ui'
    as ui;
import 'package:yx_app/utils/fake.dart' if (dart.library.html) 'dart:js'
    as js;

final bool isProd = Flavor.I.getString(API_TYPE) == 'prod' && kReleaseMode;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final String _viewId = 'video-player';

  @override
  void initState() {
    super.initState();
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      IFrameElement element = IFrameElement();
      element.style.border = 'none';
      element.src = kReleaseMode
          ? 'assets/assets/web/video-1.html'
          : 'assets/web/video-1.html';
      return element;
    });
    // ignore:undefined_prefixed_name
    js.context["isProd"] = isProd;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200, child: HtmlElementView(viewType: _viewId));
  }
}
