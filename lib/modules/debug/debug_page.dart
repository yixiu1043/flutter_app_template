import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_template/components/divider/yx_divider.dart';
import 'package:flutter_app_template/components/setting_tile/setting_tile.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';
import 'package:flutter_app_template/modules/debug/components/proxy_set_page.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_pages.dart';

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
                    context.goNamed(Routes.PROXY_SET);
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
