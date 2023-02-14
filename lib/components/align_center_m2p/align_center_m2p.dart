import 'package:flutter/material.dart';
import 'package:yx_app/utils/browser.dart';

class AlignCenterMobileInPC extends StatelessWidget {
  const AlignCenterMobileInPC({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return !isMobile()
        ? Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.13),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    blurStyle: BlurStyle.outer,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.18),
                    offset: const Offset(0, 1),
                    blurRadius: 1,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: SizedBox(width: 500, child: child),
            ),
          )
        : child;
  }
}
