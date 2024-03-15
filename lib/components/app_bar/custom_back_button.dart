import 'package:flutter/material.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.color = Colors.white,
    this.onPressed,
  }) : super(key: key);

  final Color? color;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Assets.image.icon.iconBack.image(
        width: 16,
        color: color,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
