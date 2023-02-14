import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yx_app/gen/colors.gen.dart';

class SettingTile extends StatelessWidget {
  final String? label;
  final String? value;
  final String? hint;
  final Widget? extra;
  final VoidCallback? onPressed;

  const SettingTile({
    Key? key,
    required this.label,
    this.value,
    this.hint,
    this.extra,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      child: SizedBox(
        height: 60.w,
        child: Row(
          children: [
            Text(
              label ?? '',
              style: const TextStyle(
                fontSize: 15,
                color: ColorName.colorE8E8E8A100,
              ),
            ),
            const Spacer(),
            if (extra != null) extra!,
            if (value?.isNotEmpty == true)
              Text(
                value ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  color: ColorName.colorD0D0D0,
                ),
              )
            else
              Text(
                hint ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorName.colorE8E8E8A60,
                ),
              ),
            if (onPressed != null)
              Row(
                children: [
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorName.colorE8E8E8A60,
                    size: 16.w,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
