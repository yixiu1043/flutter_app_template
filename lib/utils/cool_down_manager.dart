class CoolDownManager {
  CoolDownManager._privateConstructor();

  static final CoolDownManager _instance =
      CoolDownManager._privateConstructor();

  static CoolDownManager get instance {
    return _instance;
  }

  static Map<String, DateTime> timeMap = {};

  Future<bool> check({required String key, required int duration}) async {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(timeMap[key] ?? DateTime(1970));
    if (difference > Duration(milliseconds: duration)) {
      timeMap[key] = currentTime;
      return true;
    }
    return false;
  }
}
