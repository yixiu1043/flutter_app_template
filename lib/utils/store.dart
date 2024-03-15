/// 全局共享变量值
class Store {
  static void init() {
    isNewVersion = false;
  }
  static bool isNewVersion = false;
  static String? deviceNo = '';
  static String? userAgent = '';
  static List<Map> dictionaryConfig = [];
}
