import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yx_app/components/button/button_size.dart';
import 'package:yx_app/components/button/primary_button.dart';
import 'package:yx_app/gen/assets.gen.dart';
import 'package:yx_app/gen/colors.gen.dart';

class YxBottomSheet extends StatelessWidget {
  final String title;
  final String? confirm;
  final Widget? contentWidget;
  final VoidCallback? onConfirm;

  const YxBottomSheet({
    Key? key,
    this.contentWidget,
    required this.title,
    this.confirm,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 36,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: ColorName.colorE8E8E8A100,
                  ),
                ),
              ),
              if (contentWidget != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: contentWidget!,
                ),
              if (confirm != null)
                PrimaryButton(
                  onPressed: () {
                    if (onConfirm != null) onConfirm!();
                  },
                  block: true,
                  size: ButtonSize.large,
                  child: Text(
                    confirm ?? 'comp_confirm'.tr,
                  ),
                )
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 16,
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Assets.image.icon.iconClose.image(width: 16),
          ),
        ),
      ],
    );
  }
}
