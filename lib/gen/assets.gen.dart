/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/fa_video.png
  AssetGenImage get faVideo => const AssetGenImage('assets/image/fa_video.png');

  $AssetsImageHomeGen get home => const $AssetsImageHomeGen();
  $AssetsImageIconGen get icon => const $AssetsImageIconGen();

  /// List of all assets
  List<AssetGenImage> get values => [faVideo];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/trail_loading.json
  String get trailLoading => 'assets/lottie/trail_loading.json';

  /// List of all assets
  List<String> get values => [trailLoading];
}

class $AssetsVideoGen {
  const $AssetsVideoGen();

  /// File path: assets/video/fa.mp4
  String get fa => 'assets/video/fa.mp4';

  /// File path: assets/video/fa_bg.png
  AssetGenImage get faBg => const AssetGenImage('assets/video/fa_bg.png');

  /// List of all assets
  List<dynamic> get values => [fa, faBg];
}

class $AssetsWebGen {
  const $AssetsWebGen();

  /// File path: assets/web/video-1.html
  String get video1 => 'assets/web/video-1.html';

  /// File path: assets/web/video.html
  String get video => 'assets/web/video.html';

  /// List of all assets
  List<String> get values => [video1, video];
}

class $AssetsImageHomeGen {
  const $AssetsImageHomeGen();

  /// File path: assets/image/home/icon_tab_main.png
  AssetGenImage get iconTabMain =>
      const AssetGenImage('assets/image/home/icon_tab_main.png');

  /// File path: assets/image/home/icon_tab_main_selected.png
  AssetGenImage get iconTabMainSelected =>
      const AssetGenImage('assets/image/home/icon_tab_main_selected.png');

  /// File path: assets/image/home/icon_tab_mine.png
  AssetGenImage get iconTabMine =>
      const AssetGenImage('assets/image/home/icon_tab_mine.png');

  /// File path: assets/image/home/icon_tab_mine_selected.png
  AssetGenImage get iconTabMineSelected =>
      const AssetGenImage('assets/image/home/icon_tab_mine_selected.png');

  /// File path: assets/image/home/icon_tab_promotion.png
  AssetGenImage get iconTabPromotion =>
      const AssetGenImage('assets/image/home/icon_tab_promotion.png');

  /// File path: assets/image/home/icon_tab_promotion_selected.png
  AssetGenImage get iconTabPromotionSelected =>
      const AssetGenImage('assets/image/home/icon_tab_promotion_selected.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconTabMain,
        iconTabMainSelected,
        iconTabMine,
        iconTabMineSelected,
        iconTabPromotion,
        iconTabPromotionSelected
      ];
}

class $AssetsImageIconGen {
  const $AssetsImageIconGen();

  /// File path: assets/image/icon/icon_arrow_bottom.png
  AssetGenImage get iconArrowBottom =>
      const AssetGenImage('assets/image/icon/icon_arrow_bottom.png');

  /// File path: assets/image/icon/icon_arrow_right.png
  AssetGenImage get iconArrowRight =>
      const AssetGenImage('assets/image/icon/icon_arrow_right.png');

  /// File path: assets/image/icon/icon_arrow_top.png
  AssetGenImage get iconArrowTop =>
      const AssetGenImage('assets/image/icon/icon_arrow_top.png');

  /// File path: assets/image/icon/icon_back.png
  AssetGenImage get iconBack =>
      const AssetGenImage('assets/image/icon/icon_back.png');

  /// File path: assets/image/icon/icon_close.png
  AssetGenImage get iconClose =>
      const AssetGenImage('assets/image/icon/icon_close.png');

  /// File path: assets/image/icon/icon_logo_placeholder.png
  AssetGenImage get iconLogoPlaceholder =>
      const AssetGenImage('assets/image/icon/icon_logo_placeholder.png');

  /// File path: assets/image/icon/icon_radio_off.png
  AssetGenImage get iconRadioOff =>
      const AssetGenImage('assets/image/icon/icon_radio_off.png');

  /// File path: assets/image/icon/icon_radio_on.png
  AssetGenImage get iconRadioOn =>
      const AssetGenImage('assets/image/icon/icon_radio_on.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconArrowBottom,
        iconArrowRight,
        iconArrowTop,
        iconBack,
        iconClose,
        iconLogoPlaceholder,
        iconRadioOff,
        iconRadioOn
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsVideoGen video = $AssetsVideoGen();
  static const $AssetsWebGen web = $AssetsWebGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
