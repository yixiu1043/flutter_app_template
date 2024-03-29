import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';
import 'package:yx_app/components/yx_image/yx_image_placeholder.dart';

class YxImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final Widget? placeholder;

  const YxImage(
    this.url, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.placeholder,
  }) : super(key: key);

  @override
  State<YxImage> createState() => YxImageState();
}

class YxImageState extends State<YxImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.1,
      upperBound: 1.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      enableLoadState: true,
      clearMemoryCacheWhenDispose: false,
      image: ExtendedResizeImage.resizeIfNeeded(
        provider: ExtendedExactAssetImageProvider(widget.url),
      ),
      width: widget.width,
      height: widget.height,
      fit: widget.fit ?? BoxFit.cover,
      alignment: widget.alignment,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return widget.placeholder ?? const YxImagePlaceholder();
          case LoadState.completed:
            if (state.wasSynchronouslyLoaded) {
              return state.completedWidget;
            }
            _controller.forward();
            return FadeTransition(
              opacity: _controller,
              child: state.completedWidget,
            );
          case LoadState.failed:
            _controller.reset();
            //remove memory cached
            state.imageProvider.evict();
            return Image.asset(widget.url);
        }
      },
    );
  }
}
