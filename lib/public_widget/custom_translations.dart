import 'package:get/get.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN' : {
      'home': "首页",
    },
    'en_US' : {
      'home': "home",
    },
  };
}
