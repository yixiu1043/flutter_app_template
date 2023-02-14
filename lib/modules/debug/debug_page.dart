import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yx_app/components/divider/yx_divider.dart';
import 'package:yx_app/components/setting_tile/setting_tile.dart';
import 'package:yx_app/gen/colors.gen.dart';
import 'package:yx_app/modules/debug/components/proxy_set_page.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug页面"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
              children: [
                SettingTile(
                  label: '代理设置',
                  hint: '',
                  value: '',
                  onPressed: () {
                    Get.to(const ProxySetPage());
                  },
                ),
                const YxDivider(color: ColorName.color373737A100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
