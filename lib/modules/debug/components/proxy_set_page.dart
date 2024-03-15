import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_app_template/components/button/button_size.dart';
import 'package:flutter_app_template/components/button/primary_button.dart';
import 'package:flutter_app_template/gen/assets.gen.dart';
import 'package:flutter_app_template/gen/colors.gen.dart';
import 'package:flutter_app_template/utils/overlay_extension.dart';
import 'package:sp_util/sp_util.dart';

class ProxySetPage extends StatefulWidget {
  const ProxySetPage({Key? key}) : super(key: key);

  @override
  State<ProxySetPage> createState() => _ProxySetPageState();
}

class _ProxySetPageState extends State<ProxySetPage> {
  bool open = false;
  TextEditingController ipController =
      TextEditingController(text: SpUtil.getString("proxyIp", defValue: ""));
  TextEditingController portController = TextEditingController(
      text: SpUtil.getString("proxyPort", defValue: "8888"));

  @override
  void initState() {
    super.initState();
    open = SpUtil.getBool("setProxy", defValue: false)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('代理设置')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    open = !open;
                    SpUtil.putBool("setProxy", open);
                    if (open) {
                      SpUtil.putString("proxyIp", ipController.text);
                      SpUtil.putString("proxyPort", portController.text);
                    } else {
                      SpUtil.putString("proxyIp", "");
                      SpUtil.putString("proxyPort", "8888");
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      open
                          ? Assets.image.icon.iconRadioOn.path
                          : Assets.image.icon.iconRadioOff.path,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                const Text(
                  "代理（需要勾选,修改此选项成功后需要重启app）",
                  style: TextStyle(
                    color: ColorName.red,
                    height: 1,
                  ),
                ),
              ],
            ),
            const Gap(16),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: ColorName.white),
              controller: ipController,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: "请输入ip地址：",
                isDense: false,
                contentPadding: EdgeInsets.zero,
                hintText: "127.0.0.1",
                hintStyle: TextStyle(),
              ),
            ),
            const Gap(16),
            TextField(
              controller: portController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: ColorName.white),
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: false,
                labelText: '请输入端口号：',
                contentPadding: EdgeInsets.zero,
                hintText: "8080",
                hintStyle: TextStyle(),
              ),
            ),
            const Gap(16),
            PrimaryButton(
              block: true,
              size: ButtonSize.large,
              onPressed: () {
                SpUtil.putBool("setProxy", open);
                if (open) {
                  SpUtil.putString("proxyIp", ipController.text);
                  SpUtil.putString("proxyPort", portController.text);
                } else {
                  SpUtil.putString("proxyIp", "");
                  SpUtil.putString("proxyPort", "8888");
                }
                showToast('设置成功，请重启App');
                // if (open) {
                //   exit(0);
                // }
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
