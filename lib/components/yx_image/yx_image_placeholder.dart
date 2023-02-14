import 'package:flutter/material.dart';
import 'package:yx_app/gen/assets.gen.dart';
import 'package:yx_app/gen/colors.gen.dart';

class YxImagePlaceholder extends StatelessWidget {
  const YxImagePlaceholder({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorName.color111425,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double constraintsW = constraints.maxWidth * 0.4;
          return Center(
            child: Assets.image.icon.iconLogoPlaceholder.image(
              width: width ?? constraintsW,
              height: height ?? constraintsW * (70 / 170),
            ),
          );
        },
      ),
    );
  }
}
