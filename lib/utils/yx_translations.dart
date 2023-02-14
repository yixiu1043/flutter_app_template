import 'package:get/get.dart';

class YxTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          ///component
          'comp_cancel': '取消',
          'comp_confirm': '确定',
          'comp_copy': '复制',
          'comp_loading': '加载中...',
          'comp_toast_su': '成功',
          'comp_toast_fail': '失败',

          // home
          'home_tab_main': '首页',
          'home_tab_actress': '集美',
          'home_tab_game': '游戏',
          'home_tab_promotion': '活动',
          'home_tab_mine': '我的',
          'home_tab_exit': '再次操作退出APP',
        },
        'en_US': {
          ///component
          'comp_cancel': 'cancel',
          'comp_confirm': 'confirm',
          'comp_copy': 'copy',
          'comp_loading': 'loading...',
          'comp_toast_success': 'success',
          'comp_toast_fail': 'fail',

          // home
          'home_tab_main': '首页',
          'home_tab_actress': '集美',
          'home_tab_game': '游戏',
          'home_tab_promotion': '活动',
          'home_tab_mine': '我的',
          'home_tab_exit': '再次操作退出APP',
        }
      };
}
